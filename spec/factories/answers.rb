FactoryGirl.define do
  factory :answer do
    user
    exercise
    answer
  end

  trait :right_answer do
    truthy true
  end

  trait :wrong_answer do
    truthy false
  end
end
