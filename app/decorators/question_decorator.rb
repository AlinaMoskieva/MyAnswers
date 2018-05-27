class QuestionDecorator < ApplicationDecorator
  delegate :id, :text, :unit, :right_answer, :answers_amount, :theory, :index,
    :add_to_scenario_link_avaliable?

  def added?(test)
    test.test_questions.find_by(question: object)
  end
end
