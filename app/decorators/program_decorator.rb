class ProgramDecorator < ApplicationDecorator
  delegate :id, :name
end
