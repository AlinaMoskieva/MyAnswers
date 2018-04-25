class SurveyDecorator < ApplicationDecorator
  delegate :name, :complexity

  decorates_association :survey_questions
  decorates_association :repetitions
end
