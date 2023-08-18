require 'rails_helper'

RSpec.describe 'milkコントローラ機能', type: :request do
    describe 'CRUD機能' do
        before do
            @user = FactoryBot.create(:user, :a)
        end

        context '新規登録機能' do
            it 'ログインユーザーが新規登録画面を開ける' do
                sign_in @user
                get '/milks/new'
                expect(response).to be_successful
            end
        end

    end
end