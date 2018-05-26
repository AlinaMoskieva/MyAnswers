class QuestionDecorator < ApplicationDecorator
  delegate :id, :text, :unit, :right_answer, :answers_amount, :theory, :index
end
