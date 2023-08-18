FactoryBot.define do
    factory :user do
        
        trait :a do
            id { 1 }
            name { 'ユーザーA' }
            email { 'a@example.com' }
            password { 'password' }
            password_confirmation { 'password' }
        end

        trait :b do
            id { 2 }
            name { 'ユーザーB' }
            email { 'b@example.com' }
            password { 'password' }
            password_confirmation { 'password' }
        end

    end
end