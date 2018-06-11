module Tests
  class Create
    include Interactor::Organizer

    organize Save, TestQuestions::Create
  end
end
