class CoyellMailer < ApplicationMailer
    # 送信者のメールドレスでデフォルト値を設定
    default from: 'coyell@example.com'

    def user_creation_email(user)
        @user = user
        mail(
            subject: 'ユーザー登録完了通知',
            to: 'user@example.com',
            from: 'coyell@example.com'
        )
    end
end
