class SurveyQuestionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  expose_decorated :survey_question

  respond_to :json

  def create
    # binding.pry
  end

  def destroy
  end

  private

  def survey_question_params
  end
end
