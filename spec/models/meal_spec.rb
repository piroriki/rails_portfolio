require 'rails_helper'

RSpec.describe 'mealモデルバリデーション' do

    it '種類、量、時間が揃った場合、有効になる' do
        meal = FactoryBot.build(:meal)
        meal.valid?
        expect(meal).to be_valid
    end

    it '種類がない場合、無効になる' do
        meal = FactoryBot.build(:meal, kinds: nil)
        meal.valid?
        expect(meal.errors[:kinds]).to include('を入力してください')
    end

    it '量がない場合、無効になる' do
        meal = FactoryBot.build(:meal, amount: nil)
        meal.valid?
        expect(meal.errors[:amount]).to include('を入力してください')
    end

    it '時間がない場合、無効になる' do
        meal = FactoryBot.build(:meal, time: nil)
        meal.valid?
        expect(meal.errors[:time]).to include('を入力してください')
    end

    it 'メモが100文字以上になる場合、無効になる' do
        meal = FactoryBot.build(:meal, memo: 'a' * 105)
        meal.valid?
        expect(meal.errors[:memo]).to include('は100文字以内で入力してください')
    end

end