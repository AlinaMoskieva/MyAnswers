class SurveyDecorator < ApplicationDecorator
  delegate :name, :complexity

  decorates_association :survey_questions

end
