require 'rails_helper'

RSpec.describe Symptom, type: :model do

    it '正しい情報を入力した時、有効になる' do
        symptom = FactoryBot.build(:symptom)
        symptom.valid?  
        expect(symptom).to be_valid
    end

    it '種類未入力の時、無効になる' do
        symptom = FactoryBot.build(:symptom, kinds: nil)
        symptom.valid?

        expect(symptom.errors[:kinds]).to include('を入力してください')
    end

    it '時間未入力の時、無効になる' do
        symptom = FactoryBot.build(:symptom, time: nil)
        symptom.valid?

        expect(symptom.errors[:time]).to include('を入力してください')
    end

    it 'メモが100文字以上の時、無効になる' do
        symptom = FactoryBot.build(:symptom, memo: 'a' * 105)
        symptom.valid?

        expect(symptom.errors[:memo]).to include('は100文字以内で入力してください')
    end

end