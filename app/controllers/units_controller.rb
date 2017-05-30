class UnitsController < ApplicationController
  expose_decorated :unit
  expose :exercises, -> { unit.exercises }
  expose :course, -> { unit.subject.course }
end
