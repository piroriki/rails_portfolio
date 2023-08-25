FactoryBot.define do
    factory :medicine do
        id { 1 }  
        time { '12:30' }
        memo { 'テスト'}
        association :user
    end
end