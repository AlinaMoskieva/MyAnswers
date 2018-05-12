class TestsController < ApplicationController
  expose :test
  expose_decorated :user_answers, -> { test.user_answers.where(user: current_user).includes(test_question: :question) }
end
