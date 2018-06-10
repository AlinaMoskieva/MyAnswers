module Admin
  class TestsController < BaseController
    expose_decorated :unit_questions, :fetch_unit_questions, decorator: QuestionDecorator
    expose_decorated :test_questions, -> { test.test_questions.order(id: :asc) }
    expose_decorated :tests, -> { Test.order(sort_index: :asc) }
    expose_decorated :test

    before_action :authorize_resource, except: %i[show index]

    respond_to :json, :html

    def index
    end

    def show
    end

    def new
    end

    def create
    end

    def edit
    end

    def update
      test.update(test_params)

      if test.errors.any?
        render json: { error: test.errors.full_messages.join(", ") }, status: :unprocessable_entity
      else
        render json: test, serializer: ::TestSerializer
      end
    end

    private

    def fetch_unit_questions
      test.unit ? test.unit.questions.order(id: :asc) : []
    end

    def test_params
      params.require(:test).permit(:complexity,
        repetitions_attributes: %i[id number rule period_number period_rule _destroy])
    end

    def authorize_resource
      authorize test
    end
  end
end
