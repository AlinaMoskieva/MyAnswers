class AnswerVariant < ApplicationRecord
  validates :content, presence: true
  validates :truthy, inclusion: [true, false]

  belongs_to :test_question
end
