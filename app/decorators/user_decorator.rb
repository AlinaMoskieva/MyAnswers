class UserDecorator < ApplicationDecorator
  delegate :id, :full_name, :email

  def full_name_with_email
    "#{object.full_name} (#{object.email})"
  end

  def subscribed?(course_id)
    Subscription.where(course_id: course_id, user_id: id).empty?
  end
end
