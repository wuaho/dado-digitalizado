FactoryBot.define do
  factory :user do
    name { 'Poldo' }
    password { '123456' }
    surname { 'Poldini' }
    email { 'poldo@test1.com' }
    phone { '666555444' }
    address { 'Calle poldi' }
    birthdate { '1999-03-28' }
    nickname { 'Papadopoulos' }
    role { 'member' }
  end
end
