class TopicDecorator < ApplicationDecorator
  delegate :id, :name, :children, :parent, :parent?, :children?
end
