class Question < ApplicationRecord
  # has_many :widgets, through: :question_widgets

  validates :text, :right_answer, presence: true
  validates :answers_amount, numericality: { greater_than: 0 }

  belongs_to :unit
end
