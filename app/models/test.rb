class Survey < ApplicationRecord
  has_many :survey_questions

  validates :name, presence: true
end
