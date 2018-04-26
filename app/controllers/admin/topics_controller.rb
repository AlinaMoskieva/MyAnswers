class Admin::TopicsController < ApplicationController
  before_action :authenticate_user!

  expose :topics, -> { Topic.all }
  expose_decorated :topic

  def create
    topic.save
    respond_with topic, location: admin_topics_path
  end

  def update
    topic.update(topic_params)
    respond_with topic, location: [:admin, topic]
  end

  private

  def topic_params
    params.require(:topic).permit(:name, :parent_id)
  end
end
