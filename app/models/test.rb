class Test < ApplicationRecord
  extend Enumerize

  AVAILABLE_COMPLEXITY = %w[Низкая Средняя Высокая].freeze

  validates :name, :complexity, presence: true

  has_many :test_questions
  has_many :repetitions
  has_many :user_answers, dependent: :destroy

  accepts_nested_attributes_for :repetitions, allow_destroy: true

  enumerize :complexity, in: AVAILABLE_COMPLEXITY
end
