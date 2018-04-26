class TopicDecorator < ApplicationDecorator
  delegate :id, :name, :children
  delegate :parent, to: :object

  def has_parent?
    parent.present?
  end

  def has_children?
    children.present?
  end
end
