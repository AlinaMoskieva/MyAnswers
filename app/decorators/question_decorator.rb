class QuestionDecorator < ApplicationDecorator
  delegate :text, :unit, :right_answer, :answers_amount, :theory
end
