module Questions
  class Create
    include Interactor::Organizer

    organize Save, CreateQuestionTypes
  end
end
