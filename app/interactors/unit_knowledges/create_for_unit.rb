module UnitKnowledges
  class CreateForUnit
    include Interactor

    delegate :unit, to: :context

    def call
      User.all.each do |user|
        UnitKnowledge.create(unit: unit, user: user)
      end
    end
  end
end
