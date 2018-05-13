class TopicDecorator < ApplicationDecorator
  delegate :id, :name, :children, :parent, :units
  decorates_association :units

  def parent?
    parent.present?
  end

  def children?
    children.present?
  end

  def units?
    units.any?
  end
end
