class UnitsController < ApplicationController
  before_action :authorize!, except: %i(show index)

  expose :units, -> { Unit.all }
  expose_decorated :unit

  expose :exercises, -> { unit.exercises }

  def index
  end

  def new
  end

  def create
    unit.course = Course.first
    unit.save
    respond_with unit
  end

  def update
    unit.update_attributes(unit_params)
    respond_with unit
  end

  private

  def unit_params
    params.require(:unit).permit(:name, :description)
  end

  def authorize!
    authorize unit, "manage?"
  end
end
