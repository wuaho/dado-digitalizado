FactoryBot.define do
  factory :game do
    name { "MyString" }
    description { "MyText" }
    number_of_players { 1 }
    language { 1 }
    min_age { 1 }
    brand { "MyString" }
    stock { 1 }
  end
end
