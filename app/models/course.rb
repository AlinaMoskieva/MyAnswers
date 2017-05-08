class Course < ApplicationRecord
  has_many :users, through: :subscriptions

  validates :description, presence: true
end
