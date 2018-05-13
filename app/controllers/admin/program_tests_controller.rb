module Admin
  class ProgramTestsController < BaseController
    before_action :authorize_resource

    expose :tests, from: :program
    expose :program_test
    expose :program, id: ->{ params[:program_test][:program_id] }

    def create
      program_test.save

      render json: tests, each_serializer: ::TestSerializer
    end

    private

    def program_test_params
      params.require(:program_test).permit(:program_id, :test_id)
    end

    def authorize_resource
      authorize program
    end
  end
end
