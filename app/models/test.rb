class Test < ApplicationRecord
  extend Enumerize

  AVAILABLE_COMPLEXITY = %w[Низкая Средняя Высокая].freeze

  validates :name, :complexity, presence: true

  belongs_to :unit

  has_many :test_questions, dependent: :destroy
  has_many :repetitions, dependent: :destroy
  has_many :user_answers, dependent: :destroy
  has_many :program_tests, dependent: :destroy
  has_many :ways, dependent: :destroy

  accepts_nested_attributes_for :repetitions, allow_destroy: true

  enumerize :complexity, in: AVAILABLE_COMPLEXITY

  def first_question
    next_test_questions_ids = []
    test_questions.each { |tq| next_test_questions_ids << tq.next_ways.pluck(:next_test_question_id) }
    first_question_id = (test_questions.ids - next_test_questions_ids.flatten).first
    TestQuestion.find(first_question_id)
  end
end
