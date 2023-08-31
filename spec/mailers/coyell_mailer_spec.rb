require "rails_helper"

RSpec.describe CoyellMailer, type: :mailer do
  
  let(:user_f) { FactoryBot.create(:user, name: 'ユーザーF', email: 'f@example.com',password: 'password', password_confirmation: 'password') }
#
  #let(:text_body) do
  #  part = mail.body.parts.detect { |part| part.content_type == 'text/plain; charset=UTF-8' }
  #  part.body.raw_source
  #end
#
  #let(:html_body) do
  #  part = mail.body.parts.detect { |part| part.content_type == 'text/html; charset=UTF-8' }
  #  part.body.raw_source
  #end

  describe '#creation_email' do
    #let(:mail) { CoyellMailer.user_creation_email(user_f) }
    
    subject(:mail) do
      described_class.user_creation_email(user_f).deliver_now
      ActionMailer::Base.deliveries.last
    end

    context 'メール送信する時' do
      it '設定通りのメールが生成されている' do
        #user_f
        #text_body
        #html_body

        expect(mail.from.first).to eq('coyell@example.com')

        #ヘッダ
        #expect(mail.subject).to eq('ユーザー登録完了通知')
        #expect(mail.to).to eq(['user@example.com'])
        #expect(mail.from).to eq(['coyell@example.com'])
      #
        ##text形式の本文
        #expect(text_body).to match('新規登録したユーザーは下記のとおりです。')
        #expect(text_body).to match('ユーザーF')
        #expect(text_body).to match('f@example.com')
        ##html形式の本文
        #expect(html_body).to match('ユーザー登録完了通知')
        #expect(html_body).to match('ユーザーF')
        #expect(html_body).to match('f@example.com')
      end
    end

  end
end
