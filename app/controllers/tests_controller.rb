class TestsController < ApplicationController
  expose_decorated :tests, -> { Test.order(sort_index: :asc) }
  expose_decorated :test

  before_action :authorize_resource, except: %i[show index]

  respond_to :json, :html

  def show
  end

  def index
  end

  def edit
  end

  def update
    test.update(complexity: nil)

    if test.errors.any?
      render json: { error: test.errors.full_messages.join(", ") }, status: :unprocessable_entity
    else
      render json: test
    end
  end

  private

  def test_params
    params.require(:test).permit(:complexity)
  end

  def authorize_resource
    authorize test
  end
end
