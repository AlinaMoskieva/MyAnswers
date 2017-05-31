class ExercisePolicy < ApplicationPolicy
  def manage?
    admin?
  end
end
