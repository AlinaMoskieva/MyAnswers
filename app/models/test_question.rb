class TestQuestion < ApplicationRecord
  belongs_to :question
  belongs_to :widget
  belongs_to :test

  has_many :next_ways, class_name: "Way", foreign_key: :next_test_question_id
  has_many :current_ways, class_name: "Way", foreign_key: :current_test_question_id

  has_many :answer_variants, dependent: :destroy
end
