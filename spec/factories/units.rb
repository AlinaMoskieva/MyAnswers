FactoryGirl.define do
  factory :unit do
    course
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence(3) }
  end
end
