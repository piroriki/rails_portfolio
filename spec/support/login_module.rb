module LoginModule
    def login(user)
        visit login_path
        fill_in 'メールアドレス', with: user.email
        fill_in 'パスワード', with: user.password
        click_button 'ログインする'
    end
end