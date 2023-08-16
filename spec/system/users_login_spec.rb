require 'rails_helper'

RSpec.describe 'ユーザーログイン機能',type: :system do
    let(:user_test) { FactoryBot.create(:user, name:'テストユーザー', email:'test@example.com', password: 'password') }

    context 'テストユーザーが正しい情報を入力した時' do
        #let(:login_user) { user_test }
        before do
            visit login_path
            fill_in 'メールアドレス', with: 'test@example.com'
            fill_in 'パスワード', with: 'password'
            click_button 'ログインする'
        end

        it '正常にログインできる' do
            #expect(current_path).to eq milks_path
            expect(page).to have_content 'ログインしました'
            expect(page).to have_no_link 'ログイン'
            expect(page).to have_link 'ログアウト', href: logout_path
        end
    end

    #context 'テストユーザーが誤った情報を入力した時' do
    #    let(:user_email) { 'test@example.com'}
#
    #    before do
    #        visit login_path
    #        fill_in 'メールアドレス', with: user.email
    #        fill_in 'パスワード', with: user.password
    #        click_button 'ログインする'
    #    end
#
    #    it 'ログインできない' do
    #        let(:user_email) { '' }
#
    #        before do
    #            visit login_path
    #            fill_in 'メールアドレス', with: user.email
    #            fill_in 'パスワード', with: user.password
    #            click_button 'ログインする'
    #        end
#
    #        expect('#{uri.path}?#{uri.query}').to eq(login_path)
    #        expect(page).to have_link 'ログイン'
    #    end
    #end
end