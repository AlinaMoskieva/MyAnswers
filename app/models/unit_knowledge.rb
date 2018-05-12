class UnitKnowledge < ApplicationRecord
  validates :value, presence: true

  belongs_to :unit
  belongs_to :user
end
