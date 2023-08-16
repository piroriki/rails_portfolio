require 'rails_helper'

RSpec.describe '食事管理機能', type: :system do
    let(:user_a) { FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com', password: 'password') }
    let(:user_b) { FactoryBot.create(:user, name: 'ユーザーB', email: 'b@example.com', password: 'password') }
    let!(:meal_a) { FactoryBot.create(:meal, kinds: 'meal',amount: 'さつまいも', time: '11:11', memo: 'テスト確認用', user: user_a) }

        before do
            FactoryBot.create(:meal, kinds: 'meal', amount: 'お魚リゾット1/2瓶', time: '13:10', memo: 'テスト確認用', user: user_a)
            visit login_path
            fill_in 'メールアドレス', with: login_user.email
            fill_in 'パスワード', with: login_user.password
            click_button 'ログインする'
        end

        shared_examples_for 'ユーザーAが登録した食事記録が表示される' do
            it { expect(page).to have_content 'テスト確認用' }
        end

    describe '一覧表示機能' do
        before do
            visit meals_path(:login_user)
        end

        context 'ユーザーAがログインしている時' do
            let(:login_user) { user_a }

            it_behaves_like 'ユーザーAが登録した食事記録が表示される' 
        end

        context 'ユーザーBがログインしている時' do
            let(:login_user) { user_b }
            
            it 'ユーザーAが登録した食事記録が表示されない' do
                expect(page).to have_no_content 'テスト確認用'
            end
        end
    end
end
