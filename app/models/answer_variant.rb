class AnswerVariant < ApplicationRecord
  belongs_to :exercise

  validates :text, presence: true
end
