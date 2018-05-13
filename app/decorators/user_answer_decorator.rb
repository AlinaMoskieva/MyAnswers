class UserAnswerDecorator < ApplicationDecorator
  delegate :id, :test_question, :question, :truthy, :answer
  delegate :question, to: :test_question, prefix: true
  delegate :text, :right_answer, :theory, :theory?, to: "test_question_question", prefix: true

  def callout_color
    object.truthy? ? "primary" : "alert"
  end
end
