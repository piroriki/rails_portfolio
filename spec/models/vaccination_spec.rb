require 'rails_helper'

RSpec.describe Vaccination, type: :model do

    it '正しい情報を入力した時、有効になる' do
        vaccination = FactoryBot.build(:vaccination)
        vaccination.valid?

        expect(vaccination).to be_valid
    end

    it '種類未記入の時、無効になる' do
        vaccination = FactoryBot.build(:vaccination, kinds: nil)
        vaccination.valid?

        expect(vaccination.errors[:kinds]).to include('を入力してください')
    end

    it '時間未記入の時、無効になる' do
        vaccination = FactoryBot.build(:vaccination, time: nil)
        vaccination.valid?

        expect(vaccination.errors[:time]).to include('を入力してください')
    end

    it 'メモが100文字以上の時、無効になる' do
        vaccination = FactoryBot.build(:vaccination, memo: 'a' * 105)
        vaccination.valid?

        expect(vaccination.errors[:memo]).to include('は100文字以内で入力してください')
    end

end