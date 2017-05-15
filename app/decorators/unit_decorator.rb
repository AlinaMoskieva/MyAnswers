class UnitDecorator < ApplicationDecorator
  delegate :name, :description, :course

  def course_name
    object.course.title
  end
end
