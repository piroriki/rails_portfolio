require 'rails_helper'

RSpec.describe 'execretionモデルバリデーション' do
    
    it '正しい情報を入力した時、有効になる' do
        execretion = FactoryBot.build(:execretion)
        execretion.valid?

        expect(execretion).to be_valid
    end

    it '種類未記入の時、無効になる' do
        execretion = FactoryBot.build(:execretion, kinds: nil)
        execretion.valid?

        expect(execretion.errors[:kinds]).to include('を入力してください')
    end

    it '時間未記入の時、無効になる' do
        execretion = FactoryBot.build(:execretion, time: nil)
        execretion.valid?

        expect(execretion.errors[:time]).to include('を入力してください')
    end

    it 'メモが100文字以上の時、無効になる' do
        execretion = FactoryBot.build(:execretion, memo: 'a' * 105)
        execretion.valid?

        expect(execretion.errors[:memo]).to include('は100文字以内で入力してください')
    end

end
