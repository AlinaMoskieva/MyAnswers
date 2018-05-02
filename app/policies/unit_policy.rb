class UnitPolicy < ApplicationPolicy
  def manage?
    admin?
  end
end
