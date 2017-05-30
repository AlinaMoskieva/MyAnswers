class CoursePolicy < ApplicationPolicy
  def manage?
    admin?
  end
end
