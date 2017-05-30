class UnitDecorator < ApplicationDecorator
  delegate :name, :description, :course, :course_id, :subject_id

  def course_name
    object.subject.course.title
  end
end
