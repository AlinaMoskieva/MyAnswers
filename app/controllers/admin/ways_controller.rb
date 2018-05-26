module Admin
  class WaysController < BaseController
    skip_before_action :verify_authenticity_token

    expose :ways, from: :test
    expose :way
    expose :test, id: -> { way_params[:test_id] }

    respond_to :json

    respond_to :json

    def index
      render json: ways, each_serializer: ::WaySerializer
    end

    def create
      way.right = true
      way.save
    end

    def destroy
    end

    private

    def way_params
      params.require(:way).permit(:current_test_question_id, :next_test_question_id, :test_id)
    end
  end
end
