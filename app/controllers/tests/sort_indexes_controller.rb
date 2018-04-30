module Tests
  class SortIndexesController < ApplicationController
    respond_to :json

    expose :test

    def update
      Tests::UpdateSortIndex.call(test: test, step: test_params[:step])

      head :ok
    end

    private

    def test_params
      params.require(:test).permit(:step)
    end
  end
end
