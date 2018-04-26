FactoryBot.define do
  factory :test_question, aliases: %i[current_test_question next_test_question] do
    test
    question
    widget
  end
end
