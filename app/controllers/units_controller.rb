class UnitsController < ApplicationController
  expose :unit
  expose :tests, -> { unit.tests }
end
