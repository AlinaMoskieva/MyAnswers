class TopicsController < ApplicationController
  expose :topic
  expose :topics, -> { Topic.order(:created_at) }
  expose :units, -> { topic.units }
  expose :unit_knowledges, -> { current_user.unit_knowledges.includes(:unit) }
end
