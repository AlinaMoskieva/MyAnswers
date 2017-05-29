FactoryGirl.define do
  factory :widget do
    name  { Faker::Lorem.sentence(1) }
    descritpion { Faker::Lorem.sentence(3) }
  end
end
