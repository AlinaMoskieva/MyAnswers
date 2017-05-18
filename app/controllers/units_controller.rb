class UnitsController < ApplicationController
  expose_decorated  :unit
  expose :exercises, ->{ unit.exercises }
end
