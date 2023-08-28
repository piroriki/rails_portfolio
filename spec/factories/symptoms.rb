FactoryBot.define do
    factory :symptom do
        id { 1 }
        kinds { '鼻水' }
        time { '12:55' }
        memo { '入力テスト' }
        association :user
    end
end