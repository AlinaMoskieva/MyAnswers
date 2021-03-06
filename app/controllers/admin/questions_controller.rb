module Admin
  class QuestionsController < BaseController
    before_action :authorize_resource

    expose_decorated :unit
    expose_decorated :question
    expose_decorated :questions, -> { unit.questions }

    def create
      create_question = Questions::Create.call(question: question, unit: unit, params: params)

      respond_with create_question.question, location: [:admin, unit]
    end

    def update
      question.update(question_params)
      respond_with question, location: [:admin, question]
    end

    def destroy
      question.destroy
      respond_with question, location: [:admin, question.unit]
    end

    private

    def question_params
      params.require(:question).permit(:text, :theory, :answers_amount, :right_answer, :unit_id)
    end

    def authorize_resource
      authorize question
    end
  end
end
