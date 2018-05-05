FactoryBot.define do
  factory :question do
    text { Faker::Lorem.sentence }
    theory { Faker::Lorem.sentence }
    answers_amount { Faker::Number.between(1, 10) }
    right_answer { Faker::Lorem.sentence }
    unit
  end
end
