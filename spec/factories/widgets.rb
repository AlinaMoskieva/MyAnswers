FactoryBot.define do
  factory :widget do
    sequence(:name) { |n| "#{n}" }
    description { Faker::Lorem.word }
  end
end
