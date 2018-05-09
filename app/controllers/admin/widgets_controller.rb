module Admin
  class WidgetsController < BaseController
    expose :widgets, -> { Widget.all }
    expose :test_question, -> { TestQuestion.last }
  end
end
