module Admin
  class UnitsController < ApplicationController
    before_action :authenticate_user!

    expose_decorated :topic
    expose_decorated :unit
    expose_decorated :units, -> { Unit.all }

    def create
      unit.save
      respond_with topic, location: [:admin, unit]
    end

    def update
      unit.update(unit_params)
      respond_with topic, location: [:admin, unit]
    end

    def destroy
      unit.destroy
      respond_with unit, location: [:admin, unit.topic]
    end

    private

    def unit_params
      params.require(:unit).permit(:name).merge(topic_id: params[:topic_id])
    end
  end
end
