require 'rails_helper'

RSpec.describe User, type: :system do
    let(:user_a) { FactoryBot.build(:user, :a) }
    let(:user_b) { FactoryBot.create(:user, :b) }

    describe 'ユーザーCRUD機能' do

        describe 'ログイン前' do
            describe 'ユーザー新規登録' do

                context '正しい情報で入力した時' do
                    it 'ユーザー新規登録が成功する' do
                        sign_up(user_a)

                        expect(current_path).to eq new_admin_user_path
                        expect(page).to have_content "ユーザー「#{user_a.name}」を登録しました"
                    end
                end

                context 'メールアドレス未記入で入力した時' do
                    it 'ユーザー新規登録に失敗する' do
                        visit new_admin_user_path
                        fill_in 'お名前', with: user_a.name
                        fill_in 'メールアドレス', with: nil
                        fill_in 'パスワード', with: user_a.password
                        fill_in 'パスワード(確認)', with: user_a.password_confirmation
                        click_button '登録する'

                        expect(page).to have_content 'メールアドレスを入力してください'
                        expect(current_path).to eq new_admin_user_path
                    end
                end

                context '名前未記入で入力した時' do
                    it 'ユーザー新規登録に失敗する' do
                        visit new_admin_user_path
                        fill_in 'お名前', with: nil
                        fill_in 'メールアドレス', with: user_a.email
                        fill_in 'パスワード', with: user_a.password
                        fill_in 'パスワード(確認)', with: user_a.password_confirmation
                        click_button '登録する'
            
                        expect(current_path).to eq new_admin_user_path
                        expect(page).to have_content 'お名前を入力してください'
                    end
                end

                context '登録済みメールアドレスが入力された時' do
                    it 'ユーザー新規登録に失敗する' do
                        sign_up(user_a)

                        visit new_admin_user_path
                        fill_in 'お名前', with: user_b.name
                        fill_in 'メールアドレス', with: user_a.email
                        fill_in 'パスワード', with: user_b.password
                        fill_in 'パスワード(確認)', with: user_b.password_confirmation
                        click_button '登録する'

                        expect(current_path).to eq new_admin_user_path
                        expect(page).to have_content 'ールアドレスはすでに存在します'
                    end
                end

            end
        end

        describe 'ログイン後' do
            before do
                sign_up(user_b)
                visit login_path
                login(user_b)
            end

            describe 'ユーザー登録後' do
                it '正常にログインできる' do
                    expect(page).to have_content 'ログインしました'
                    expect(page).to have_link 'ログアウト', href: logout_path
                end
            end

            describe 'ユーザー編集' do
                context '正しい情報で入力した時' do
                    it 'ユーザー編集に成功する' do
                        visit admin_user_path(user_b.id)
                        click_link '編集'
                        fill_in 'メールアドレス', with: 'test@example.com'
                        fill_in 'パスワード',with: user_b.password
                        fill_in 'パスワード(確認)',with: user_b.password_confirmation
                        click_button '登録する'

                        expect(page).to have_content 'ユーザー一覧'
                        expect(page).to have_content 'test@example.com'
                    end
                end

                context 'メールアドレス未記入で入力した時' do
                    it 'ユーザー編集に失敗する' do
                        visit admin_user_path(user_b.id)
                        click_link '編集'
                        fill_in 'メールアドレス', with: nil
                        fill_in 'パスワード',with: user_b.password
                        fill_in 'パスワード(確認)',with: user_b.password_confirmation
                        click_button '登録する'

                        expect(current_path).to eq edit_admin_user_path(user_b)
                        expect(page).to have_content 'メールアドレスを入力してください'
                    end
                end

                context '名前未記入で入力した時' do
                    it 'ユーザー編集に失敗する' do
                        visit admin_user_path(user_b.id)
                        click_link '編集'
                        fill_in 'お名前',with: nil
                        fill_in 'メールアドレス', with: user_b.email
                        fill_in 'パスワード',with: user_b.password
                        fill_in 'パスワード(確認)',with: user_b.password_confirmation
                        click_button '登録する'

                        expect(page).to have_content 'お名前を入力してください'
                    end
                end

            end

        end
    end
end