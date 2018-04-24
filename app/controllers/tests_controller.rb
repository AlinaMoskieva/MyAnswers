class SurveysController < ApplicationController
  expose_decorated :surveys, -> { Survey.all }
  expose_decorated :survey

  def index
  end

  def edit
  end

  def update
  end

  private

  def survey_params
  end
end
