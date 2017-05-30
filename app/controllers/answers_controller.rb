class AnswersController < ApplicationController
  expose :answer, attributes: :answer_params
  expose :exercise
  expose :unit

  def create
    save_answer

    path = unit if unit.last_exercises?(exercise.index)
    path = unit_exercise_path(unit, unit.next_exercise(exercise.index)) unless path
    redirect_to path
  end

  private

  def answer_params
    params.require(:answer).permit(:answer)
  end

  def save_answer
    answer.exercise = exercise
    answer.user = current_user
    answer.check_answer(exercise.answer)
    answer.save
  end
end
