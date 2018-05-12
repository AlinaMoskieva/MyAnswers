module Admin
  class ProgramsController < BaseController
    before_action :authorize_resource

    expose_decorated :programs
    expose_decorated :program

    def index
    end

    private

    def programs_params
    end

    def authorize_resource
      authorize program
    end
  end
end
