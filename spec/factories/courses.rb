FactoryGirl.define do
  factory :course do
    description { Faker::Lorem.sentence(3) }
    title { Faker::Lorem.sentence(1) }
  end
end
