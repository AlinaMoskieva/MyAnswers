class WidgetsController < ApplicationController
  before_action :authorize!

  expose :widgets, -> { Widget.all }
  expose :widget

  def index
  end

  def new
  end

  def create
    widget.save
    respond_with widget
  end

  def update
    widget.update_attributes(widget_params)
    respond_with widget
  end

  private

  def widget_params
    params.require(:widget).permit(:name, :description)
  end

  def authorize!
    authorize widget, "manage?"
  end
end
