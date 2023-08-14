require 'rails_helper'

RSpec.describe 'ミルク管理機能', type: :system do
    describe '一覧表示機能' do
        let(:user_a) { FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com', password: 'password') }
        let(:user_b) { FactoryBot.create(:user, name: 'ユーザーB', email: 'b@example.com', password: 'password') }

        before do
            FactoryBot.create(:milk, kinds: 'milk', amount: '150', time: '5:15', memo: 'テスト', user: user_a)
            visit login_path
            fill_in 'メールアドレス', with: login_user.email
            fill_in 'パスワード', with: login_user.password
            click_button 'ログインする'
        end

        context 'ユーザーAがログインしている時' do
            let(:login_user) { user_a }

            it 'ユーザーAが登録したミルク記録が表示される' do
                expect(page).to have_content 'テスト'
            end
        end

        context 'ユーザーBがログインしている時' do
            let(:login_user) { user_b }

            it 'ユーザーAで作成したミルク記録が表示されない' do
                expect(page).to have_no_content 'テスト' 
            end
        end
    end
end
