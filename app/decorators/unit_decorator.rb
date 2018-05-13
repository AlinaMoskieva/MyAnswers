class UnitDecorator < ApplicationDecorator
  delegate :id, :name, :topic, :unit_knowledges
end
