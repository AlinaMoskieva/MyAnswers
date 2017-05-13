FactoryGirl.define do
  factory :exercise do
    unit
    question { Faker::Lorem.sentence(1) }
    answer { Faker::Lorem.sentence(1) }
    theory { Faker::Lorem.sentence(3) }
  end
end
