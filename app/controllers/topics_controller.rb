class TopicsController < ApplicationController
  expose :topic
  expose :units, -> { topic.units }
  expose :unit_knowledges, -> { current_user.unit_knowledges.includes(:unit) }
end
