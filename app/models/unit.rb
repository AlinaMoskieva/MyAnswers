class Unit < ApplicationRecord
  validates :name, presence: true

  belongs_to :topic
  has_many :questions, dependent: :destroy
end
