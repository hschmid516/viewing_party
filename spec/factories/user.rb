FactoryBot.define do
  factory :user, class: User do
    email { Faker::Internet.unique.email }
    password_digest { Faker::Alphanumeric.alphanumeric(number: 30) }
    name { Faker::Name.unique.first_name }
    created_at { "2012-03-27 14:53:59 UTC" }
    updated_at { "2012-03-27 14:53:59 UTC" }
  end
end
