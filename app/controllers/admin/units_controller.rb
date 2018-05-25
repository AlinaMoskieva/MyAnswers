module Admin
  class UnitsController < BaseController
    before_action :authorize_resource

    expose_decorated :topic
    expose_decorated :unit
    expose_decorated :questions, from: :unit

    def show
      respond_to do |format|
        format.html { respond_with unit }
        format.json { render json: unit, serializer: ::UnitSerializer }
      end
    end

    def create
      create_unit = Units::Create.call(unit: unit, topic: topic)

      respond_with create_unit.unit, location: [:admin, unit]
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
