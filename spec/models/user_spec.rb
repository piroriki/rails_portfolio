require 'rails_helper'

RSpec.describe 'userモデル機能', type: :model do
    it '名前、メールアドレス、パスワードが揃った場合、有効になる' do
        user = FactoryBot.build(:user)
        expect(user).to be_valid
    end

    it 'メールアドレスがない場合、無効になる' do
        user = FactoryBot.build(:user, email: nil)
        user.valid? #valid?メソッドでエラー検証を行う、errorsメソッド仕様に必須
        expect(user.errors[:email]).to include('を入力してください')
    end
    
    it 'パスワードがない場合、無効になる' do
        user = FactoryBot.build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include('を入力してください')
    end

    it '名前がない場合、無効になる' do
        user = FactoryBot.build(:user, name: nil)
        user.valid?
        expect(user.errors[:name]).to include('を入力してください')
    end

    it '重複するメールアドレスの場合、無効になる' do
        user1 = FactoryBot.create(:user)
        user2 = FactoryBot.build(:user)
        user2.valid?
        expect(user2.errors[:email]).to include('はすでに存在します')
    end

end