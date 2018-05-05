class TestsController < ApplicationController
  expose_decorated :tests, -> { Test.order(sort_index: :asc) }
  expose_decorated :test

  before_action :authorize_resource, except: %i(show index)

  def show
  end

  def index
  end

  def edit
  end

  def update
  end

  private

  def test_params
  end

  def authorize_resource
    authorize test
  end
end
