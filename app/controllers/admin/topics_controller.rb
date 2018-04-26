class Admin::TopicsController < ApplicationController
  before_action :authenticate_user!

  expose :topics, -> { Topic.all }
  expose :topic

  def create
    topic.save
    respond_with topic, location: admin_topics_path
  end

  private

  def topic_params
    params.require(:topic).permit(:name, :parent_id)
  end
end
