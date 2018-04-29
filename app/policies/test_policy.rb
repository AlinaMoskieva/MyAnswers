class TestPolicy < ApplicationPolicy
  def manage?
    admin?
  end
end
