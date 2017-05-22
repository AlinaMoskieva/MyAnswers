class AnswersController < ApplicationController
  expose :answer, attributes: :answer_params
  expose :exercise
  expose :unit

  def create
    answer.exercise = exercise
    answer.user = current_user
    answer.check_answer(exercise.answer)
    answer.save

    redirect_to unit_exercise_path(unit, exercise)
  end

  private

  def answer_params
    params.require(:answer).permit(:answer)
  end
end
