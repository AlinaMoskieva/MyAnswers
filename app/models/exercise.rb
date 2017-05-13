class Exercise < ApplicationRecord
  belongs_to :unit

  validates :question, :answer, :unit, presence: true
end
