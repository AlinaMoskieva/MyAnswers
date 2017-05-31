class Exercise < ApplicationRecord
  belongs_to :unit
  # belongs_to :widget
  has_many :answers, dependent: :destroy
  has_many :answer_variants, dependent: :destroy

  validates :question, presence: true
end
