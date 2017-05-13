class CoursesController < ApplicationController
  expose :courses, ->{ Course.all }
  expose :course
end
