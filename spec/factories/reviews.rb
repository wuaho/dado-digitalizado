FactoryBot.define do
  factory :review do
    title { "This game is awesome" }
    description { "This is the best game ever. Its addictive and super fun." }
    rating { 5 }
    association :user
    association :game
  end
end
