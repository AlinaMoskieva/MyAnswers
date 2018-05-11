class Question < ApplicationRecord
  validates :text, :right_answer, presence: true
  validates :answers_amount, numericality: { greater_than: 0 }

  belongs_to :unit

  has_many :question_types, dependent: :destroy
end
