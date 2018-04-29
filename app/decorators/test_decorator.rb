class TestDecorator < ApplicationDecorator
  delegate :name, :complexity

  decorates_association :test_questions
  decorates_association :repetitions
end
