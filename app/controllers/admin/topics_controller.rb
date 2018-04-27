module Admin
  class TopicsController < ApplicationController
    before_action :authenticate_user!

    expose_decorated :topics, -> { Topic.all }
    expose_decorated :topic

    def create
      topic.save
      respond_with topic, location: [:admin, topic]
    end

    def update
      topic.update(topic_params)
      respond_with topic, location: [:admin, topic]
    end

    def destroy
      topic.destroy
      respond_with topic, location: admin_topics_path
    end

    private

    def topic_params
      params.require(:topic).permit(:name, :parent_id)
    end
  end
end
