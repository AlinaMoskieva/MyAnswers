FactoryBot.define do
  factory :user_answer do
    answer { Faker::Lorem.word }
    truthy false
    user
    test_question

    trait :right do
      truthy true
    end
  end
end
