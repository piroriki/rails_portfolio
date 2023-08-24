FactoryBot.define do
    factory :milk do
        id { 1 }
        kinds { 'milk' }
        amount { '100' }
        time { '12:12' }
        memo { 'ミルク入力確認' }
        association :user # :milkファクトリをuserファクトリと関連づける
    end
end