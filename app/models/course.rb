class Course < ApplicationRecord
  has_many :subscriptions, dependent: :destroy
  has_many :units, dependent: :destroy

  has_many :users, through: :subscriptions

  validates :description, :title, presence: true
end
