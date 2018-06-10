module Admin
  class ProgramsController < BaseController
    before_action :authorize_resource

    expose :program
    expose_decorated :programs, -> { Program.all.order(id: :asc) }
    expose_decorated :tests, -> { Test.all.order(id: :asc) }
    expose_decorated :program_tests, :fetch_program_tests, decorator: TestDecorator

    def index
    end

    def new
    end

    def create
      program.save

      respond_with program, location: edit_admin_program_path(program)
    end

    def update
      program.update_attributes(program_params)

      if program.errors.any?
        render json: { error: program.errors.full_messages.join(", ") }, status: :unprocessable_entity
      else
        render json: program
      end
    end

    private

    def fetch_program_tests
      program
        .tests
        .select("tests.id, tests.name, tests.complexity, program_tests.sort_index as sort_index, program_tests.program_id as program_id")
        .order("program_tests.sort_index asc")
    end

    def program_params
      params.require(:program).permit(:name, :days_number, :execution)
    end

    def authorize_resource
      authorize program
    end
  end
end
