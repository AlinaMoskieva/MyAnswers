class Unit < ApplicationRecord
  belongs_to :subject
  has_many :exercises, dependent: :destroy
  has_many :user_units, dependent: :destroy
  has_many :users, through: :user_units

  validates :name, :subject, :description, presence: true
end
