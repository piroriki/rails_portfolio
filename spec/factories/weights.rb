FactoryBot.define do
  factory :weight do
    id { 1 }
    weight { "9.5" }
    time { "12:12" }

    association :user
  end
end
