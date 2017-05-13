FactoryGirl.define do
  factory :unit do
    course
    name { Faker::Lorem.word }
  end
end
