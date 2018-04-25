class SurveyQuestionDecorator < ApplicationDecorator
  delegate :text, to: :question, prefix: true

  decorates_association :question
end
