class QuestionType < ApplicationRecord
  extend Enumerize

  TYPES = %w[number math picture choice full_answer yes_no].freeze

  enumerize :answer_type, in: TYPES, predicates: true, default: "number"

  belongs_to :question

  has_many :test_questions
end
