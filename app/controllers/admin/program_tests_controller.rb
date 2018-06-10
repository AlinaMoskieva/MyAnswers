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
      # binding.pry
      program_test_params[:step] ? update_sort_index : program_test.update_attributes(program_test_params)


      render json: tests, each_serializer: ::TestSerializer, program: program
    end

    def destroy
      program.program_tests.find_by(test_id: program_test_params[:test_id]).destroy

      render json: tests, each_serializer: ::TestSerializer
    end

    private

    def update_sort_index
      ProgramTests::UpdateSortIndex.call(program_test: program_test, step: program_test_params[:step])
    end

    def fetch_tests
      program.tests.order("program_tests.sort_index asc")
    end

    def program_test_params
      params.require(:program_test).permit(:program_id, :test_id, :step, :day_number)
    end

    def authorize_resource
      authorize program
    end
  end
end
