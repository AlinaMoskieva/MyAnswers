FactoryBot.define do
  factory :unit do
    name { Faker::Lorem.word }
    topic
  end
end
