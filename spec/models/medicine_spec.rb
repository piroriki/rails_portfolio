require 'rails_helper'

RSpec.describe Medicine, type: :model do
    
    describe 'medicineモデルバリデーション機能' do
        it '正しい情報が入力された時、有効になる' do
            medicine = FactoryBot.build(:medicine)
            medicine.valid?
            expect(medicine).to be_valid
        end

        it '時間未記入の時、無効になる' do
            medicine = FactoryBot.build(:medicine, time: nil)
            medicine.valid?
            expect(medicine.errors[:time]).to include('を入力してください')
        end

        it 'メモが100文字以上の時、無効になる' do
            medicine = FactoryBot.build(:medicine, memo: 'a' * 105)
            medicine.valid?
            expect(medicine.errors[:memo]).to include('は100文字以内で入力してください')
        end
    end
    
end