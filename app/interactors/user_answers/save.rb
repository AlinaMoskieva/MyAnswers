module UserAnswers
  class Save
    include Interactor

    delegate :user_answer, to: :context
    delegate :test_question, to: :user_answer
    delegate :question, to: :test_question

    def call
      user_answer.truthy = check_answer
      user_answer.save! || context.fail!(error: user_answer.errors)
    end

    private

    def check_answer
      user_answer.answer.downcase.strip.eql?(question.right_answer.downcase)
    end
  end
end
