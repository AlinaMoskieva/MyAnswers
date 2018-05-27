class Way < ApplicationRecord
  belongs_to :current_test_question, class_name: "TestQuestion"
  belongs_to :next_test_question, class_name: "TestQuestion"
  belongs_to :test

  validates :test, uniqueness: { scope: [:current_test_question, :next_test_question] }
end
