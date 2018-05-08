module Admin
  class WidgetsController < ApplicationController
    expose :widgets, -> { Widget.all }
    expose :test_question, -> { TestQuestion.last }
    # before_action :authorize_resource

    # def authorize_resource
    #   authorize unit
    # end
  end
end
