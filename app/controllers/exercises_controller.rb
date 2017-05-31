class ExercisesController < ApplicationController
  before_action :authorize!, except: %i(show index)

  expose :exercise
  expose :exercises

  expose :unit
  expose :units, -> { Unit.all }
  expose :answer_variants, -> { exercise.answer_variants }

  def create
    exercise.save
    respond_with exercise, location: new_unit_exercise_answer_variant_path(exercise.unit, exercise)
  end

  def update
    exercise.update_attributes(exercise_params)
    respond_with exercise
  end

  def list
  end

  private

  def exercise_params
    params.require(:exercise).permit(:unit_id, :theory, :question, :index)
  end

  def authorize!
    authorize exercise, "manage?"
  end
end
