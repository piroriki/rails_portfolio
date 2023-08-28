FactoryBot.define do
    factory :vaccination do
        id { 1 }
        kinds { '肺炎球菌' }
        time { '12:14' }
        memo { '登録確認テスト' }
        association :user
    end
end