module Admin
  class TestQuestionsController < BaseController
    skip_before_action :verify_authenticity_token

    expose_decorated :test_question
    expose :questions, :fetch_questions
    expose :test, id: -> { test_question_params[:test_id] }

    respond_to :json

    def index
      render json: questions, each_serializer: ::QuestionSerializer
    end

    def create
      test_question.question_type = QuestionType.first
      test_question.widget = Widget.first
      test_question.save

      if test_question.errors.any?
        render json: { error: test_question.errors.full_messages.join(", ") }, status: :unprocessable_entity
      else
        render json: {
          id: test_question.question.id, index: test_question.question.index, test_question_id: test_question.id
        }, status: :ok
      end
    end

    def update
      test_question.update(test_question_params)

      if test_question.errors.any?
        render json: { error: test_question.errors.full_messages.join(", ") }, status: :unprocessable_entity
      else
        render json: test_question, serializer: ::TestQuestionSerializer
      end
    end

    def destroy
      test_question.destroy
    end

    private

    def update_scenario
    end

    def fetch_questions
      test.test_questions.where(in_scenario: true).map { |tq| tq.question }.uniq
    end

    def test_question_params
      params.require(:test_question).permit(:widget_id, :question_id, :test_id, :in_scenario)
    end
  end
end
