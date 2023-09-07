FactoryBot.define do
  factory :height do
    id { 1 }
    height { '100.3'}
    time { '12:21'}

    association :user
  end
end
