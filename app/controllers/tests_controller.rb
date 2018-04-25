class TestsController < ApplicationController
  expose_decorated :tests, -> { Test.all }
  expose_decorated :test

  def index
  end

  def edit
  end

  def update
  end

  private

  def test_params
  end
end
