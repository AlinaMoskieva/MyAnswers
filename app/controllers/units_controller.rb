class UnitsController < ApplicationController
  before_action :authorize!, except: %i(show index)

  expose :units, -> { Unit.all }
  expose_decorated :unit

  expose :course, -> { unit.subject.course }
  expose :subjects, -> { Subject.all }
  expose :exercises, -> { unit.exercises }

  def index
  end

  def new
  end

  def create
    unit.save
    respond_with unit
  end

  def update
    unit.update_attributes(unit_params)
    respond_with unit
  end

  private

  def unit_params
    params.require(:unit).permit(:name, :description, :subject_id, :course_id)
  end

  def authorize!
    authorize unit, "manage?"
  end
end
