FactoryBot.define do
  factory :widget do
    name "1"
    description { Faker::Lorem.word }
  end
end
