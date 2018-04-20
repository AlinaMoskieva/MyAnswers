FactoryBot.define do
  factory :way do
    association :current_question, factory: :question
    association :next_question, factory: :question
  end
end
