FactoryBot.define do
  factory :game do
    name { 'Parchis' }
    description { 'El juego del parchis para toda la familia!' }
    min_players { 4 }
    max_players { 4 }
    language { 1 }
    min_age { 4 }
    brand { 'Namco' }
    stock { 1 }
  end
end
