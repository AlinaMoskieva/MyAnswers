class Way < ApplicationRecord
  belongs_to :current_question, class_name: "Question"
  belongs_to :next_question, class_name: "Question"
end
