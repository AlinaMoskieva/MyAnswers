class TestsController < ApplicationController
  expose_decorated :tests, -> { Test.all }
  expose_decorated :test

  before_action :authorize_resource, except: :index

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
