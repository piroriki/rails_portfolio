require 'rails_helper'

RSpec.describe 'ミルク管理機能', type: :system do
    describe '一覧表示機能' do
        before do
            user_a = FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com', password: 'password')
            FactoryBot.create(:milk, kinds: 'milk', amount: '150', time: '5:15', memo: 'テスト', user: user_a)
        end

        context 'ユーザーが既にログインしている時' do
            before do
                visit login_path
                fill_in 'メールアドレス', with: 'a@example.com'
                fill_in 'パスワード', with: 'password'
                click_button 'ログインする'
            end

            it 'ユーザーAが登録したミルク記録が表示される' do
                expect(page).to have_content 'テスト'
            end
        end

        context 'ユーザーBがログインしている時' do
            before do
                user_b= FactoryBot.create(:user, name: 'ユーザーB',email: 'b@example.com', password: 'password')
                visit login_path
                fill_in 'メールアドレス', with: 'b@example.com'
                fill_in 'パスワード', with: 'password'
                click_button 'ログインする'
            end

            it 'ユーザーAで作成したミルク記録が表示されない' do
                expect(page).to have_no_content 'テスト' 
            end
        end
    end
end
