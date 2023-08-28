require 'rails_helper'

RSpec.describe Diary, type: :model do

    it '正しい情報を入力する時、有効になる' do
        diary = FactoryBot.build(:diary)
        diary.valid?

        expect(diary).to be_valid
    end

    it 'タイトル未記入の時、無効になる' do
        diary = FactoryBot.build(:diary, title: nil)
        diary.valid?

        expect(diary.errors[:title]).to include('を入力してください')
    end

    it 'タイトルが100文字以上の時、無効になる' do
        diary = FactoryBot.build(:diary, title: 'a' * 105)
        diary.valid?

        expect(diary.errors[:title]).to include('は100文字以内で入力してください')
    end

    it '本文未記入の時、無効になる' do
        diary = FactoryBot.build(:diary, content: nil)
        diary.valid?

        expect(diary.errors[:content]).to include('を入力してください')
    end

    it '本文が5,000文字以上の時、無効になる' do
        diary = FactoryBot.build(:diary, content: 'a' * 5001)
        diary.valid?

        expect(diary.errors[:content]).to include('は5000文字以内で入力してください')
    end
    
end