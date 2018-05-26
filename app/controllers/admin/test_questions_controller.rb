module Admin
  class TestQuestionsController < BaseController
    skip_before_action :verify_authenticity_token

    expose_decorated :test_question

    respond_to :json

    def create
      test_question.question_type = QuestionType.first
      test_question.widget = Widget.first
      test_question.save

      if test_question.errors.any?
        render json: { error: test_question.errors.full_messages.join(", ") }, status: :unprocessable_entity
      else
        render json: { index: test_question.question.index }, status: :ok
      end
    end

    def update
      test_question.update(test_question_params)

      if test_question.errors.any?
        render json: { error: test_question.errors.full_messages.join(", ") }, status: :unprocessable_entity
      else
        render json: test_question
      end
    end

    def destroy
    end

    private

    def test_question_params
      params.require(:test_question).permit(:widget_id, :question_id, :test_id)
    end
  end
end
