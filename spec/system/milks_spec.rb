require 'rails_helper'

RSpec.describe Milk, type: :system do
    #userモデルのファクトリ作成
    let(:user_a) { FactoryBot.create(:user, :a) }
    let(:user_b) { FactoryBot.create(:user, :b) }
    
    #milkモデルのファクトリ作成
    let(:milk_a) { FactoryBot.create(:milk, kinds: 'milk', amount: '100', time: '12:12', memo: 'ミルク入力確認', user: user_a) }
    let(:milk_b) { FactoryBot.create(:milk, kinds: 'breast_milk', amount: '150', time: '15:30', memo: '母乳入力確認', user: user_b) }
    
    shared_examples_for 'ユーザーAに紐づくミルク記録が表示される' do
        it { expect(page).to have_content 'ミルク入力確認' }
    end

    describe 'ユーザーログイン機能' do
        before do
            sign_up(user_a)
            visit login_path
            login(user_a)
        end    

        context 'ユーザー登録後にログインする時' do
            it '正常にログインできる' do
                expect(page).to have_content 'ログインしました'
                expect(page).to have_link 'ログアウト', href: logout_path
            end
        end
    end

    describe '新規登録機能' do
        describe 'ユーザーAでログインする時' do

            before do
                sign_up(user_a)
                visit login_path
                login(user_a)
            end

            context '正しい情報で入力する時' do
                it 'ユーザーAに紐づくミルク記録が入力できる' do
                    click_link 'ミルク入力'
                    choose 'milk_kinds_milk'
                    fill_in '量', with: milk_a.amount
                    fill_in '時間', with: milk_a.time
                    fill_in 'メモ', with: milk_a.memo
                    click_button '登録する'
                    expect(page).to have_content '登録完了しました'
                    expect(current_path).to eq milks_path
                end
            end

            context '種類未記入で入力した時' do
                it '新規登録に失敗する' do
                    click_link 'ミルク入力'
                    fill_in '量', with: milk_a.amount
                    fill_in '時間', with: milk_a.time
                    fill_in 'メモ', with: milk_a.memo
                    click_button '登録する'

                    expect(page).to have_content '種類を入力してください'
                end
            end

            context '量未記入で入力した時' do
                it '新規登録に失敗する' do
                    click_link 'ミルク入力'
                    choose 'milk_kinds_milk'
                    fill_in '量', with: nil
                    fill_in '時間', with: milk_a.time
                    fill_in 'メモ', with: milk_a.memo
                    click_button '登録する'  

                    expect(page).to have_content '量を入力してください'
                end
            end

            context '時間未記入で入力した時' do
                it '新規登録に失敗する' do
                    click_link 'ミルク入力'
                    choose 'milk_kinds_milk'
                    fill_in '量', with: milk_a.amount
                    fill_in '時間', with: nil
                    fill_in 'メモ', with: milk_a.memo
                    click_button '登録する' 

                    expect(page).to have_content '時間を入力してください'
                end
            end
        end

        describe 'ユーザーBでログインする時' do
            
            before do
                sign_up(user_a)
                visit login_path
                login(user_a)
            end

            context '正しい情報で入力する時' do

                before do
                    click_link 'ミルク入力'
                    choose 'milk_kinds_breast_milk'
                    fill_in '量', with: milk_b.amount
                    fill_in '時間', with: milk_b.time
                    fill_in 'メモ', with: milk_b.memo
                    click_button '登録する'
                end

                it 'ユーザーBに紐づくミルク記録が登録できる' do
                    expect(page).to have_content '登録完了しました'
                end

                it 'ユーザーBのミルク一覧にはユーザーAの記録が表示されない' do
                    expect(page).to have_no_content 'ミルク入力確認'
                    expect(page).to have_content '母乳入力確認'
                    expect(current_path).to eq milks_path
                end
            end
        end
    end  

    describe '詳細表示機能' do

        before do
            sign_up(user_a)
            visit login_path
            login(user_a)

            milk_a.save
            click_link '記録一覧'
        end    

        context 'ユーザーAでログインしている時' do

            it_behaves_like 'ユーザーAに紐づくミルク記録が表示される'

            it 'ユーザーAが作成した記録の詳細が表示される' do
                visit milk_path(milk_a.id)
                
                expect(page).to have_content 'milk'
                expect(page).to have_link '編集', href: edit_milk_path(milk_a.id)
            end
        end
    end

    describe '編集機能' do

        before do
            sign_up(user_a)
            visit login_path
            login(user_a)

            milk_a.save
            click_link '記録一覧'
        end   
       
        context 'ユーザーAでログインする時' do
            it_behaves_like 'ユーザーAに紐づくミルク記録が表示される'
        end

        context '正しい情報で入力する時' do
            it '正常に記録編集ができる' do
                milk_a.save

                click_link '編集'
                choose 'milk_kinds_milk'
                fill_in '量', with: '240'
                fill_in '時間', with: milk_a.time
                fill_in 'メモ', with: 'ミルク編集確認'
                click_button '登録する'

                expect(page).to have_content 'ミルク編集確認'
                expect(current_path).to eq milks_path
            end
        end

    end 

end