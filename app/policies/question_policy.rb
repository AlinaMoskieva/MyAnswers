class QuestionPolicy < ApplicationPolicy
  def manage?
    admin?
  end
end
