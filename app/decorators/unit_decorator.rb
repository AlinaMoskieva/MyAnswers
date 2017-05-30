class UnitDecorator < ApplicationDecorator
  delegate :name, :description, :course

  def course_name
    object.subject.course.title
  end
end
