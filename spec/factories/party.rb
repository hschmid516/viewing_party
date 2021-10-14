FactoryBot.define do
  factory :party, class: Party do
    duration { Faker::Number.number(digits: 3) }
    day { '2021/01/21' }
    time { '12:00' }
    title { Faker::Movie.unique.title }
    created_at { "2012-03-27 14:53:59 UTC" }
    updated_at { "2012-03-27 14:53:59 UTC" }
  end
end
