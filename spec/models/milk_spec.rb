require 'rails_helper'

RSpec.describe Milk, type: :model do
    
    it '種類、量、時間が揃った場合、有効になる' do
        milk = FactoryBot.build(:milk)
        milk.valid?
        expect(milk).to be_valid
    end

    it '種類がない場合、無効になる' do
        milk = FactoryBot.build(:milk, kinds: nil)
        milk.valid?
        expect(milk.errors[:kinds]).to include('を入力してください')
    end

    it '量がない場合、無効になる' do
        milk = FactoryBot.build(:milk, amount: nil)
        milk.valid?
        expect(milk.errors[:amount]).to include('を入力してください')
    end

    it '時間がない場合、無効になる' do
        milk = FactoryBot.build(:milk, time: nil)
        milk.valid?
        expect(milk.errors[:time]).to include('を入力してください')
    end

    it 'メモが100文字以上になる場合、無効になる' do
        milk = FactoryBot.build(:milk, memo: 'a' * 105)
        milk.valid?
        expect(milk.errors[:memo]).to include('は100文字以内で入力してください')
    end
    
end