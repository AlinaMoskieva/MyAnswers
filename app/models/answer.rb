class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :exercise

  validates :user, :exercise, presence: true

  def check_answer(right_answer)
    self.truthy = answer.eql?(right_answer)
  end
end
