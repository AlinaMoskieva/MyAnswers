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

    private

    def fetch_program_tests
      program.tests.order("program_tests.sort_index asc")
    end

    def program_params
      params.require(:program).permit(:name)
    end

    def authorize_resource
      authorize program
    end
  end
end
