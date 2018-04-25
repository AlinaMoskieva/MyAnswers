FactoryBot.define do
  factory :survey_question, aliases: %i(current_survey_question next_survey_question) do
    survey
    question
    widget
  end
end
