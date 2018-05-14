class ProgramPolicy < ApplicationPolicy
  def manage?
    admin?
  end
end
