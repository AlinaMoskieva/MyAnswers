class Course < ApplicationRecord
  has_many :users, through: :subscriptions
  has_many :units, dependent: :destroy

  validates :description, :title, presence: true
end
