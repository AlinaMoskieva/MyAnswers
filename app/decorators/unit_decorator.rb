class UnitDecorator < ApplicationDecorator
  delegate :name, :description, :course, :course_id, :subject_id

  def course_name
    object.course.title
  end
end
