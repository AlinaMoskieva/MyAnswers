class Survey < ApplicationRecord
  has_many :survey_questions
  has_many :repetitions

  accepts_nested_attributes_for :repetitions, allow_destroy: :true

  validates :name, presence: true
end
