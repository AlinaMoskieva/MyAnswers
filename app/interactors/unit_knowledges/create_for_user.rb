module UnitKnowledges
  class CreateForUser
    include Interactor

    delegate :user, to: :context

    def call
      Unit.all.each do |unit|
        UnitKnowledge.create(unit: unit, user: user)
      end
    end
  end
end
