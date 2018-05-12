module Admin
  module Tests
    class SortIndexesController < ApplicationController
      respond_to :json

      expose :tests, -> { Test.all.order(sort_index: :asc) }
      expose :test

      def update
        Tests::UpdateSortIndex.call(test: test, step: test_params[:step])

        render json: tests, each_serializer: ::TestSerializer
      end

      private

      def test_params
        params.require(:test).permit(:step)
      end
    end
  end
end
