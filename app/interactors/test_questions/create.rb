module TestQuestions
  class Create
    include Interactor

    delegate :test, to: :context

    def call
      unit.questions.each do |question|
        create_test_question(question) || context.fail!(error: "Ошибка при создании вопросов теста")
      end
    end

    private

    def unit
      test.unit
    end

    def create_test_question(question)
      TestQuestion.create(test: test, question: question, widget: Widget.first,
        question_type: QuestionType.first, in_scenario: false)
    end
  end
end
