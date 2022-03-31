FactoryBot.define do
  factory :membership do
    active { true }
    started_on { "2022-03-31" }
    expires_on { "2022-04-31" }
    association :user
  end
end
