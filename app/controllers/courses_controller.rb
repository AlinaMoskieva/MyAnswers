class CoursesController < ApplicationController
  before_action :authorize!, except: %i(show index)

  expose :courses, -> { Course.all }
  expose :course
  expose :subjects, -> { course.subjects }

  def create
    course.save
    respond_with course
  end

  def update
    course.update_attributes(course_params)
    respond_with course
  end

  private

  def course_params
    params.require(:course).permit(:title, :description)
  end

  def authorize!
    authorize course, "manage?"
  end
end
