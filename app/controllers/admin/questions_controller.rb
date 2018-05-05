module Admin
  class QuestionsController < ApplicationController
    before_action :authorize_resource

    expose_decorated :unit
    expose_decorated :question
    expose_decorated :questions, -> { unit.questions }

    def create
      question.unit = unit

      question.save
      respond_with question, location: [:admin, unit]
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
