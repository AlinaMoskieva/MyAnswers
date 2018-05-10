class TestQuestionDecorator < ApplicationDecorator
  delegate :id, :widget_id
  delegate :text, to: :question, prefix: true

  decorates_association :question
end
