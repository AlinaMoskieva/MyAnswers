class Exercise < ApplicationRecord
  belongs_to :unit
  has_many :answers, dependent: :destroy

  validates :question, :answer, :unit, presence: true
end
