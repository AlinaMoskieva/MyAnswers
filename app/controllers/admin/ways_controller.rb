module Admin
  class WaysController < BaseController
    skip_before_action :verify_authenticity_token

    expose :ways, :fetch_ways
    expose :way
    expose :test, id: -> { way_params[:test_id] }

    respond_to :json

    respond_to :json

    def index
      render json: ways, each_serializer: ::WaySerializer
    end

    def create
      assign_attributes

      way.save

      if way.errors.any?
        render json: { error: way.errors.full_messages.join(", ") }, status: :unprocessable_entity
      else
        head :no_content
      end
    end

    def destroy
    end

    private

    def fetch_ways
      arr1 = test.ways.joins(:next_test_question).where(test_questions: { in_scenario: true })
      arr2 = test.ways.joins(:current_test_question).where(test_questions: { in_scenario: true })

      arr1 & arr2
    end

    def assign_attributes
      test_id = way_params[:test_id]

      way.assign_attributes(
        current_test_question_id: TestQuestion.find_by(test_id: test_id, question_id: params[:current_question_id]).id,
        next_test_question_id: TestQuestion.find_by(test_id: test_id, question_id: params[:next_question_id]).id,
        right: true
      )
    end

    def way_params
      params.require(:way).permit(:test_id)
    end
  end
end
