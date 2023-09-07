FactoryBot.define do
  factory :head_circumference do
    id { 1 }
    circumference { '33.5' }
    time { '15:40' }

    association :user
    
  end
end
