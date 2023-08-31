class CoyellMailer < ApplicationMailer

    # 送信者のメールドレスでデフォルト値を設定
    default from: 'coyell@example.com'

    def user_creation_email(user)
        @user = user
        mail_info = {
            subject: 'ユーザー登録完了通知',
            to: 'user@example.com',
            from: 'coyell@example.com',
            from_display_name: 'coyell運営',
            body: "ユーザー「#{@user.name}」の新規登録が完了しました。"
        }

        from = Mail::Address.new mail_info['from']
        from.display_name = mail_info['from_display_name']

        mail(subject: mail_info['subject'], from: from.format, to: mail_info['to']) do |format|
            format.text { render plain: mail_info['body'] }
        end

        #@url = 'http://localhost:3000/login'
    end
end
