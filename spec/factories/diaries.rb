FactoryBot.define do
    factory :diary do
        id { 1 }
        title { '登録確認' }
        content { 'CRUD機能が実現できているか' }
        association :user
    end
end