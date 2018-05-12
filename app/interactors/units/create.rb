module Units
  class Create
    include Interactor::Organizer

    organize Save, UnitKnowledges::CreateForUnit
  end
end
