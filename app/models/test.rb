class Test < ApplicationRecord
  extend Enumerize

  AVAILABLE_COMPLEXITY = %w[Низкая Средняя Высокая].freeze

  validates :name, :complexity, presence: true

  belongs_to :unit

  has_many :test_questions
  has_many :repetitions

  accepts_nested_attributes_for :repetitions, allow_destroy: true

  enumerize :complexity, in: AVAILABLE_COMPLEXITY
end
