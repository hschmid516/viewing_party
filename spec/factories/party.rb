FactoryBot.define do
  factory :party, class: Party do
    duration { Faker::Number.number(digits: 3) }
    day { Faker::Date.between(from: '11/01/21', to: '01/30/22') }
    time { Faker::Time.forward }
    title { Faker::Movie.unique.title }
    created_at { "2012-03-27 14:53:59 UTC" }
    updated_at { "2012-03-27 14:53:59 UTC" }
  end
end
