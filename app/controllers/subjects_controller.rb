class SubjectsController < ApplicationController
  expose :subjects, -> { Subject.all }
  expose :subject
  expose :units, -> { subject.units }
end
