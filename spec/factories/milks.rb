FactoryBot.define do
    factory :milk do
        kinds { 'milk' }
        amount { '100' }
        time { '12:12' }
        memo { 'テスト確認用' }
        user # :milkファクトリをuserファクトリと関連づける
    end
end