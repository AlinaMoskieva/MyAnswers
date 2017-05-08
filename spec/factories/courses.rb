FactoryGirl.define do
  factory :course do
    description { Faker::Lorem.sentence(3) }
  end
end
