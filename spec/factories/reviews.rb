FactoryBot.define do
  factory :review do
    title { "MyString" }
    description { "MyText" }
    rating { 1 }
    association :user
    association :game
  end
end
