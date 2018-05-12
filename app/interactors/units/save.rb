module Units
  class Save
    include Interactor

    delegate :unit, :topic, to: :context

    def call
      unit.topic = topic

      unit.save || context.fail!(error: unit.errors)
    end
  end
end
