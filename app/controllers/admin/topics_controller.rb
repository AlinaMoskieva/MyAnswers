module Admin
  class TopicsController < BaseController
    before_action :authorize_resource

    expose :topics, -> { Topic.order(:created_at) }
    expose_decorated :topic
    expose_decorated :units, -> { topic.units }

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

    def authorize_resource
      authorize topic
    end
  end
end
