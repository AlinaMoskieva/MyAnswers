class Widget < ApplicationRecord
  extend Enumerize

  TYPES = %w[number math picture choice full_answer yes_no].freeze

  enumerize :question_type, in: TYPES, predicates: true, default: "number"

  validates :name, :description, presence: true

  has_many :test_questions, dependent: :destroy
end
