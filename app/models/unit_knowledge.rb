class UnitKnowledge < ApplicationRecord
  validates :value, presence: true
  validates :unit, uniqueness: { scope: :user }

  belongs_to :unit
  belongs_to :user
end
