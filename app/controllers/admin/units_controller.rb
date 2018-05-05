module Admin
  class UnitsController < ApplicationController
    before_action :authorize_resource

    expose_decorated :topic
    expose_decorated :unit
    expose_decorated :questions, -> { unit.questions }

    def create
      unit.topic = topic

      unit.save
      respond_with topic, location: [:admin, unit]
    end

    def update
      unit.update(unit_params)
      respond_with unit, location: [:admin, unit]
    end

    def destroy
      unit.destroy
      respond_with unit, location: [:admin, unit.topic]
    end

    private

    def unit_params
      params.require(:unit).permit(:name)
    end

    def authorize_resource
      authorize unit
    end
  end
end
