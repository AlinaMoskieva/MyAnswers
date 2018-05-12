class UserAnswersController < ApplicationController
  expose :user_answer
  expose :test_question
  expose :test, -> { test_question.test }

  def create
    create_user_answer = UserAnswers::Create.call(user_answer: user_answer)
    respond_with create_user_answer.question, location: location
  end

  private

  def user_answer_params
    params.require(:user_answer).permit(:answer).merge(test_question: test_question, user: current_user, test: test)
  end

  def location
    return test if test_question.current_ways.empty?
    test_question.current_ways.find_by(right: user_answer.truthy).next_test_question
  end
end
