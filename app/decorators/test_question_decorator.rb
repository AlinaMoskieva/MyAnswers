class TestQuestionDecorator < ApplicationDecorator
  delegate :id, :widget, :widget_id, :in_scenario
  delegate :text, to: :question, prefix: true
  delegate :name, to: :widget, prefix: true

  decorates_association :question

  def added?
    in_scenario
  end
end
