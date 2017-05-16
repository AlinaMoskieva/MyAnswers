class UserUnit < ApplicationRecord
  belongs_to :user
  belongs_to :unit

  validates :user, :unit, presence: true
  validates :user, uniqueness: { scope: :unit }
end
