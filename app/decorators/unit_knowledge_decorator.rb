class UnitKnowledgeDecorator < ApplicationDecorator
  delegate :id, :value

  def td_color
    return "hsl(0}, 100%, 100%)" if value.zero?
    "hsl(#{value * 100}, 100%, 50%)"
  end

  def value_in_percentage
    "#{value * 100}%"
  end
end
