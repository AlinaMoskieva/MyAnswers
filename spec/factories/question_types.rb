FactoryBot.define do
  factory :question_type do
    answer_type { QuestionType::TYPES.sample }
    question
  end
end
