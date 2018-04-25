class TestQuestionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  expose_decorated :test_question

  respond_to :json

  def create
    # binding.pry
  end

  def destroy
  end

  private

  def test_question_params
  end
end
