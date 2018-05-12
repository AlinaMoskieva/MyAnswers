module Admin
  class WaysController < BaseController
    skip_before_action :verify_authenticity_token

    expose :way

    respond_to :json

    def create
      way.right = true
      way.save
    end

    def destroy
    end

    private

    def way_params
      params.require(:way).permit(:current_test_question_id, :next_test_question_id)
    end
  end
end
