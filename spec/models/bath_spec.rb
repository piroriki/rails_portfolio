require 'rails_helper'

RSpec.describe Bath, type: :model do
    
    it '正しい情報を送信する時、有効になる' do
        bath = FactoryBot.build(:bath)
        bath.valid?
        expect(bath).to be_valid
    end

    it '時間が未記入の時、無効になる' do
        bath = FactoryBot.build(:bath, time: nil)
        bath.valid?
        expect(bath.errors[:time]).to include('を入力してください')
    end

    it 'メモが100文字を超える時、無効になる' do
        bath = FactoryBot.build(:bath, memo: 'a' * 105)
        bath.valid?
        expect(bath.errors[:memo]).to include('は100文字以内で入力してください')
    end

end