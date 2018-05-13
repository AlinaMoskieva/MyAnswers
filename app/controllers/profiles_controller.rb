class ProfilesController < ApplicationController
  expose_decorated :topics, -> { Topic.all.includes(units: :unit_knowledges) }
end
