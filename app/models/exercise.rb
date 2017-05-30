class Exercise < ApplicationRecord
  belongs_to :unit
  belongs_to :widget
  has_many :answers, dependent: :destroy

  validates :question, :answer, :unit, presence: true
end
