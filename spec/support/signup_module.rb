module SignupModule
    def sign_up(user)
        visit new_admin_user_path
        fill_in 'お名前', with: user.name
        fill_in 'メールアドレス', with: user.email
        fill_in 'パスワード', with: user.password
        fill_in 'パスワード(確認)', with: user.password_confirmation
        click_button '登録する'
    end
end