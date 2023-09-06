FactoryBot.define do
  factory :temperature do
    id { 1 } 
    temperature { "36.3" }
    time { "12:12" }
    association :user
  end
end
