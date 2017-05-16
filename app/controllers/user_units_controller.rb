class UserUnitsController < ApplicationController
  expose :user_unit

  def create
    user_unit.user = current_user
    user_unit.unit = Unit.find(params[:unit_id])
    user_unit.save

    redirect_to user_unit.unit
  end

  def destroy
    course = user_unit.unit.course
    user_unit.destroy
    redirect_to course
  end
end
