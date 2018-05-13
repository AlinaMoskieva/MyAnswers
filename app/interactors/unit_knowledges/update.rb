module UnitKnowledges
  class Update
    include Interactor

    delegate :user_answer, to: :context
    delegate :truthy, :user, :test, to: :user_answer, prefix: true
    delegate :unit, to: "user_answer_test", prefix: true

    def call
      return if !user_answer_truthy
      unit_knowledge.update(value: value)
      # binding.pry
    end

    private

    def unit_knowledge
      @unit_knowledge ||= UnitKnowledge.find_by(user: user_answer_user, unit: user_answer_test_unit)
    end

    def value
      unit_knowledge.value + increment
    end

    def increment
      # test_question.type.probability - unit_knowledge.value / user_answer.test_question.question.answers_amount
      0.2
    end
  end
end
