class TestsController < ApplicationController
  expose_decorated :test_questions, -> { test.test_questions.order(id: :asc) }
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
    test.update(test_params)

    if test.errors.any?
      render json: { error: test.errors.full_messages.join(", ") }, status: :unprocessable_entity
    else
      render json: test
    end
  end

  private

  def test_params
    params.require(:test).permit(:complexity, repetitions: %i[id number rule period_number period_rule])
  end

  def authorize_resource
    authorize test
  end
end
