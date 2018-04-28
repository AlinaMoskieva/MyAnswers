class UnitDecorator < ApplicationDecorator
  delegate :id, :name, :topic
end
