class TestDecorator < ApplicationDecorator
  delegate :name

  decorates_association :test_questions

end
