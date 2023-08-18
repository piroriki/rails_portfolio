require 'rails_helper'

RSpec.describe 'ユーザーログイン機能',type: :request do
    let!(:user_a) { FactoryBot.create(:user, :a) }

    it 'ログインページが表示される' do
        get login_path
        expect(response).to have_http_status(200)
    end

    context 'ユーザーAが正しい情報を入力した時' do
        before do
            visit login_path
            fill_in 'メールアドレス', with: user_a.email
            fill_in 'パスワード', with: user_a.password
            click_button 'ログインする'
        end

        it '正常にログインできる' do
            expect(current_path).to eq root_path
            expect(page).to have_content 'ログインしました'
            expect(page).to have_link 'ログアウト', href: logout_path
        end
    end

    context 'ユーザーAが誤った情報を入力した時' do
        before do
            visit login_path
            fill_in 'メールアドレス', with: 'test@example.com'
            fill_in 'パスワード', with: user_a.password
            click_button 'ログインする'
        end

        it 'ログインできない' do
            expect(current_path).to eq login_path
            expect(page).to have_link 'ログイン'
        end
        
    end
end