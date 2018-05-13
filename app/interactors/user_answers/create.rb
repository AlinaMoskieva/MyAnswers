module UserAnswers
  class Create
    include Interactor::Organizer

    organize Save, UnitKnowledges::Update
  end
end
