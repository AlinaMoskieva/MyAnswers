FactoryBot.define do
  factory :question do
    text
    theory { Faker::Lorem.sentence }
  end
end
