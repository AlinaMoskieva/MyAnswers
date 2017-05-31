class SubjectPolicy < ApplicationPolicy
  def manage?
    admin?
  end
end
