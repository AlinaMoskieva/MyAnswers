class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  validates :full_name, presence: true

  has_many :subscriptions, dependent: :destroy
  has_many :user_units, dependent: :destroy
  has_many :couses, through: :subscriptions
  has_many :units, through: :user_units
  has_many :answers, dependent: :destroy
end
