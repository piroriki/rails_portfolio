FactoryBot.define do
    factory :milk do

        trait :a do 
            id { 1 }
            kinds { 'milk' }
            amount { '100' }
            time { '12:12' }
            memo { 'ミルク入力確認' }
            association :user # :milkファクトリをuserファクトリと関連づける
        end

        trait :b do
            id { 2 }
            kinds { 'breast_milk' }
            amount { '150' }
            time { '15:15' }
            memo { '母乳入力確認' }
            association :user
        end

    end
end