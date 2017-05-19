class CoursesController < ApplicationController
  expose :courses, -> { Course.all }
  expose :course
  expose :units, -> { course.units }
end
