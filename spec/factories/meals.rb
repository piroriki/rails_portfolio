FactoryBot.define do
    factory :meal do
        kinds { 'meal' }
        amount { 'カボチャペースト3さじ' }
        time { '15:15' }
        memo { 'テスト' }
        user
    end
end