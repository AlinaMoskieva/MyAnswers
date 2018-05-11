FactoryBot.define do
  factory :widget do
    name "1"
    description { Faker::Lorem.word }
    question_type { QuestionType::TYPES.sample }
  end
end
