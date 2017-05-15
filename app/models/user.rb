class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  validates :full_name, presence: true

  has_many :couses, through: :subscriptions
  has_many :answers, dependent: :destroy
end
