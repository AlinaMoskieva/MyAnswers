module Questions
  class CreateQuestionTypes
    include Interactor

    delegate :question, :params, to: :context

    def call
      return if params[:question_types].nil?

      params[:question_types].each do |type|
        QuestionType.create(question: question, answer_type: type) || context.fail!
      end
    end
  end
end
