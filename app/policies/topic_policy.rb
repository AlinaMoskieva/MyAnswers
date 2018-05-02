class TopicPolicy < ApplicationPolicy
  def manage?
    admin?
  end
end
