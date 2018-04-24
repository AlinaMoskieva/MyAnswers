class WaysController < ApplicationController
  skip_before_action :verify_authenticity_token

  expose :way

  respond_to :json

  def create
    # binding.pry
    way.right = true
    way.save
  end

  def destroy
  end

  private

  def way_params
    params.require(:way).permit(:current_survey_question_id, :next_survey_question_id)
  end
end
