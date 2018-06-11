module Tests
  class Save
    include Interactor

    delegate :test, to: :context

    def call
      test.complexity = "Низкая"
      test.save || context.fail!(error: test.errors)
    end
  end
end
