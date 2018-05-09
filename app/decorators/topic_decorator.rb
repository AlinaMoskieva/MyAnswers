class TopicDecorator < ApplicationDecorator
  delegate :id, :name, :children, :parent

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
