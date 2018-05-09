module Admin
  class BaseController < ApplicationController
    before_action :authenticate_user!, :authorize_admin

    layout "admin"

    private

    def authorize_admin
      redirect_to root_path unless current_user.admin?
    end
  end
end
