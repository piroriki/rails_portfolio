require 'rails_helper'

RSpec.describe 'userモデルバリデーション', type: :model do
    
    it '名前、メールアドレス、パスワードが揃った場合、有効になる' do
        user = FactoryBot.build(:user, :a)
        expect(user).to be_valid
    end

    it 'メールアドレスがない場合、無効になる' do
        user = FactoryBot.build(:user, :a, email: nil)
        user.valid? #valid?メソッドでエラー検証を行う、errorsメソッド仕様に必須
        expect(user.errors[:email]).to include('を入力してください')
    end
    
    it 'パスワードがない場合、無効になる' do
        user = FactoryBot.build(:user, :a, password: nil)
        user.valid?
        expect(user.errors[:password]).to include('を入力してください')
    end

    it '名前がない場合、無効になる' do
        user = FactoryBot.build(:user, :a, name: nil)
        user.valid?
        expect(user.errors[:name]).to include('を入力してください')
    end

    it '重複するメールアドレスの場合、無効になる' do
        user1 = FactoryBot.create(:user, :a)
        user2 = FactoryBot.build(:user, :b, email: 'a@example.com')
        user2.valid?
        expect(user2.errors[:email]).to include('はすでに存在します')
    end

    it 'nameは50文字以内でなければ、無効になる' do
        user = FactoryBot.build(:user, :a, name: 'a' * 51)
        user.valid?
        expect(user.errors[:name]).to include('は50文字以内で入力してください')
    end

    it 'emailは100文字以内でなければ、無効になる' do
        user = FactoryBot.build(:user, :a, email: "#{'a' * 101 }@example.com")
        user.valid?
        expect(user.errors[:email]).to include('は100文字以内で入力してください')
    end

end