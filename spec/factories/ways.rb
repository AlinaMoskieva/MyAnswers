FactoryBot.define do
  factory :way do
    current_survey_question
    next_survey_question
    right false

    trait :right do
      right true
    end

    trait :wrong do
      right false
    end
  end
end
