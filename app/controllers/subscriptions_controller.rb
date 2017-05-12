class SubscriptionsController < ApplicationController
  expose :subscription

  def create
    subscription.user = current_user
    subscription.course = Course.find(params[:course_id])
    subscription.save

    respond_with subscription, location: courses_path
  end

  def destroy
    subscription.destroy
    respond_with subscription, location: courses_path
  end
end
