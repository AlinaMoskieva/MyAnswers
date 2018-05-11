module Questions
  class Save
    include Interactor

    delegate :question, :unit, to: :context

    def call
      question.unit = unit

      question.save || context.fail!(error: question.errors)
    end
  end
end
