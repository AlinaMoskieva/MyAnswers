class AnswerVariantsController < ApplicationController
  before_action :authorize!, except: %i(index)

  expose :unit
  expose :exercise

  expose :answer_variant
  expose :answer_variants

  def new
  end

  def create
    answer_variant.save
    respond_with answer_variant, location: unit_path(answer_variant.exercise.unit)
  end

  def update
    answer_variant.update_attributes(answer_variant_params)
    respond_with answer_variant
  end

  private

  def answer_variant_params
    params.require(:answer_variant).permit(:exercise_id, :text, :truthy)
  end

  def authorize!
    authorize answer_variant, "manage?"
  end
end
