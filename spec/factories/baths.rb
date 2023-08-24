FactoryBot.define do
    factory :bath do
        id { 1 }
        time { '12:12' }
        memo { 'お風呂入力確認' }
        association :user # :milkファクトリをuserファクトリと関連づける
    end
end