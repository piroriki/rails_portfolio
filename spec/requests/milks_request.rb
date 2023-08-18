require 'rails_helper'

RSpec.describe 'milkコントローラ機能', type: :request do
    let!(:user_a) { FactoryBot.create(:user, :a) }

    before do
        visit login_path
        fill_in 'メールアドレス', with: user_a.email
        fill_in 'パスワード', with: user_a.password
        click_button 'ログインする'
    end

    describe 'CRUD機能' do

        context '新規登録機能' do
            it '正常なレスポンスを返す' do
                get new_milk_path
                puts "Response location: #{response.location}"
                expect(response).to have_http_status(200)
            end
        end

    end
end