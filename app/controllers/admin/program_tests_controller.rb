module Admin
  class ProgramTestsController < BaseController
    before_action :authorize_resource

    expose :tests, :fetch_tests
    expose :program_test
    expose :program, id: -> { program_test_params[:program_id] }

    def create
      program_test.sort_index = ProgramTests::FindMaxSortIndex.call(program: program).sort_index + 1
      program_test.save

      render json: tests, each_serializer: ::TestSerializer
    end

    def update
      ProgramTests::UpdateSortIndex.call(program_test: program_test, step: program_test_params[:step])

      render json: tests, each_serializer: ::TestSerializer
    end

    def destroy
      program.program_tests.find_by(test_id: program_test_params[:test_id]).destroy

      render json: tests, each_serializer: ::TestSerializer
    end

    private

    def fetch_tests
      program.tests.order("program_tests.sort_index asc")
    end

    def program_test_params
      params.require(:program_test).permit(:program_id, :test_id, :step)
    end

    def authorize_resource
      authorize program
    end
  end
end
