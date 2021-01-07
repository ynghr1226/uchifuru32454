FactoryBot.define do
  factory :user do
    name                    { Faker::Name.initials(number: 2) }
    email                   { Faker::Internet.free_email }
    password                { 'aaa111' }
    password_confirmation   { password }
    last_name               { '山田' }
    first_name              { '太郎' }
  end
end
