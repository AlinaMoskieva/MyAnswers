class AnswerVariantPolicy < ApplicationPolicy
  def manage?
    admin?
  end
end
