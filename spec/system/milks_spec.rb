require 'rails_helper'

RSpec.describe 'ミルク管理機能', type: :system do
    let!(:user_a) { FactoryBot.create(:user, :a) }
    let!(:milk_a) { FactoryBot.create(:milk, kinds:'milk', amount:'130', time: '13:13', user: user_a) }
    
    describe 'ユーザーログイン機能' do

        context 'ユーザーAがログインする時' do
            before do
                login_support(user_a)
            end

            it '正常にホーム画面に遷移される' do
                expect(page).to have_content('ログインしました')
                expect(page).to have_link 'ログアウト', href: logout_path
            end
        end

        context 'ユーザーAがログインできなかった時' do
            before do
                visit login_path
                fill_in 'メールアドレス', with: user_a.email
                fill_in 'パスワード', with: ''
                click_button 'ログインする'
            end

            it 'ログイン画面にリダイレクトされる' do
                expect(current_path).to eq login_path
                expect(page).to have_link 'ユーザー登録', href: new_admin_user_path
            end
        end

    end

    describe '一覧表示機能' do
        before do
            login_support(user_a)
            visit milks_path
            #@milk_a = FactoryBot.create(:milk, kinds:'milk', amount:'130', time: '13:13', user: user_a)
        end

        context 'ミルク一覧画面にアクセスする時' do
            it '正常に遷移される' do
                expect(page).to have_content 'ミルク入力確認'
            end
        end
    end
end