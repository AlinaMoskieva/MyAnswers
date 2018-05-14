class TestsController < ApplicationController
  expose :test
  expose_decorated :user_answers, -> { test.user_answers.where(user: current_user).includes(test_question: :question) }
  expose_decorated :unit, -> { test.unit }
  expose_decorated :unit_knowledge, -> { unit.unit_knowledges.find_by(user: current_user) }
end
