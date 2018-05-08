class Test < ApplicationRecord
  validates :name, presence: true

  has_many :test_questions
  has_many :repetitions
  has_many :user_answers, dependent: :destroy

  accepts_nested_attributes_for :repetitions, allow_destroy: true
end
