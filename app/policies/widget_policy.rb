class WidgetPolicy < ApplicationPolicy
  def manage?
    admin?
  end
end
