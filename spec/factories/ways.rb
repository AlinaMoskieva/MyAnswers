FactoryBot.define do
  factory :way do
    current_test_question
    next_test_question
    right false

    trait :right do
      right true
    end

    trait :wrong do
      right false
    end
  end
end
