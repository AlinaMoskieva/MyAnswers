class Way < ApplicationRecord
  belongs_to :current_test_question, class_name: "TestQuestion"
  belongs_to :next_test_question, class_name: "TestQuestion"
  belongs_to :test
end
