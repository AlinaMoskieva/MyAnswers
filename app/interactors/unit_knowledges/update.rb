module UnitKnowledges
  class Update
    include Interactor

    delegate :user_answer, to: :context
    delegate :truthy, :user, :test, to: :user_answer, prefix: true
    delegate :test_question, to: :user_answer
    delegate :question_type, :question, :answer_variants, to: :test_question
    delegate :unit, to: "user_answer_test", prefix: true

    def call
      return if !user_answer_truthy
      unit_knowledge.update(value: value)
    end

    private

    def unit_knowledge
      @unit_knowledge ||= UnitKnowledge.find_by(user: user_answer_user, unit: user_answer_test_unit)
    end

    def value
      new_value = unit_knowledge.value + increment
      new_value < 100 ? (new_value % 100).round(2) : 100
    end

    def increment
      probability - unit_knowledge.value / question.answers_amount
    end

    def probability
      return 1.0 / question.answers_amount if question_type.answer_type.in?(["number", "picture", "math"])
      return 1.0 / answer_variants.count if question_type.answer_type.eql? "choice"
      return 0.5 if question_type.answer_type.eql? "yes_no"
      1
    end
  end
end
