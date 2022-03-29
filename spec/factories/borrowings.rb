FactoryBot.define do
  factory :borrowing do
    starts_on { "2022-03-28" }
    expires_on { "2022-03-30" }
    association :user
    association :game
  end
end
