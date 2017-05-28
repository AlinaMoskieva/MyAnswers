FactoryGirl.define do
  factory :subject do
    course
    name { Faker::Lorem.word }
  end
end
