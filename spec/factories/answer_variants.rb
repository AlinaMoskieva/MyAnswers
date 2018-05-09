FactoryBot.define do
  factory :answer_variant do
    content { Faker::Lorem.word }
    test_question
    truthy false

    trait :right do
      truthy true
    end
  end
end
