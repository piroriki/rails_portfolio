require 'rails_helper'

RSpec.describe 'ユーザーログイン機能',type: :request do

    context '未ログイン状態のユーザーである時' do
        before do
            get milks_path
        end

        it 'ログインページが表示される' do
            expect(current_path).to eq milks_path
        end
    end
    
    context 'ユーザーがログインした時' do
        before do
            @user = FactoryBot.create(:user, :a)
            post login_path, params: { session: { email: @user.email, password: @user.password } }
        end

        it 'ホーム画面にリダイレクトされる' do
            expect(response).to redirect_to root_path
        end

        it 'HTTPステータスが302になっている' do
            expect(response).to have_http_status(302)
        end

        before do
            get new_milk_path
        end

        it 'milk一覧画面が表示できる' do
            expect(response).to have_http_status(200)
            expect(current_path).to eq new_milk_path
        end

    end

    context 'ユーザーがログインに失敗した時' do
        before do
            @user = FactoryBot.create(:user, :a )
            post login_path, params: { session: { email: 'invalid', password: @user.password } }
        end

        it 'ログイン画面にリダイレクトされる' do
            expect(response).to redirect_to login_path
        end

        it 'HTTPステータスが302になっている' do
            expect(response).to have_http_status(302)
        end

    end

end