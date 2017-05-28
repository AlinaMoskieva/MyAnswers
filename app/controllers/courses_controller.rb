class CoursesController < ApplicationController
  expose :courses, -> { Course.all }
  expose :course
  expose :subjects, -> { course.subjects }
end
