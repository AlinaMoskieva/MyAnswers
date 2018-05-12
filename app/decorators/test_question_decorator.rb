class TestQuestionDecorator < ApplicationDecorator
  delegate :id, :widget
  delegate :text, to: :question, prefix: true
  delegate :name, to: :widget, prefix: true

  decorates_association :question
end
