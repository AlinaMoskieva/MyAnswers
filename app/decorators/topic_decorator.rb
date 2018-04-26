class TopicDecorator < ApplicationDecorator
  delegate :id, :name, :children, :parent, :has_parent?, :has_children?
end
