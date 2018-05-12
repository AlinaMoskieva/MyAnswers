class Unit < ApplicationRecord
  validates :name, presence: true

  belongs_to :topic
  has_many :questions, dependent: :destroy
  has_many :unit_knowledges, dependent: :destroy
  has_many :tests, dependent: :destroy
end
