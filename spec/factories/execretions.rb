FactoryBot.define do
    factory :execretion do
        id { 1 }
        kinds { 'うんち' }
        time { '13:40' }
        memo { 'テスト' }
        association :user
    end
end
