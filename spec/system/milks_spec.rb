require 'rails_helper'

RSpec.describe 'ミルク管理機能', type: :system do
    let(:user_a) { FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com', password: 'password') }
    let(:user_b) { FactoryBot.create(:user, name: 'ユーザーB', email: 'b@example.com', password: 'password') }
    let!(:milk_a) { FactoryBot.create(:milk, kinds:'breast_milk', amount: '130', time: '17:17', memo: '詳細表示確認') }

        before do
            FactoryBot.create(:milk, kinds: 'milk', amount: '150', time: '5:15', memo: 'テスト', user: user_a)
            visit login_path
            fill_in 'メールアドレス', with: login_user.email
            fill_in 'パスワード', with: login_user.password
            click_button 'ログインする'
        end

        shared_examples_for 'ユーザーAが登録したミルク記録が表示される' do
            it { expect(page).to have_content 'テスト' }
        end

    describe '一覧表示機能' do
        context 'ユーザーAがログインしている時' do
            let(:login_user) { user_a }
            
            it_behaves_like 'ユーザーAが登録したミルク記録が表示される'
        end
        
        context 'ユーザーBがログインしている時' do
            let(:login_user) { user_b }
            it 'ユーザーAが登録したミルク記録が表示されない' do
                expect(page).to have_no_content 'テスト' 
            end
        end
    end

    describe '詳細表示機能' do
        context 'ユーザーAがログインしている時' do
            let(:login_user) { user_a }
           
            before do
               visit milks_path(:milk_a)
            end
        
            it_behaves_like 'ユーザーAが登録したミルク記録が表示される'
        end
    end

    describe '新規登録機能' do
        let(:login_user) { user_a }
        let(:milk_amount) { '240' }

        before do
            visit new_milk_path
            choose('milk[kinds]', option: 'breast_milk')
            fill_in '量', with: milk_amount
            fill_in '時間', with: '23:23'
            fill_in 'メモ', with: '新規登録機能確認'
            click_button '登録する'
        end

        context '新規登録画面で量を入力した時' do
            it '正常に登録される' do
                expect(page).to have_selector '.alert-success', text: '登録完了しました'
            end
        end

        context '新規作成画面で量を入力しなかった時' do
            let(:milk_amount) { '' }

            it 'エラーとなる' do
               within '#error_explanation' do
                 expect(page).to have_content '量を入力してください'
                end
            end
        end
    end

end