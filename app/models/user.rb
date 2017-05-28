class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  ROLES = {
    "user" => "user",
    "admin" => "admin"
  }.freeze

  validates :full_name, presence: true

  has_many :subscriptions, dependent: :destroy
  has_many :user_units, dependent: :destroy
  has_many :couses, through: :subscriptions
  has_many :units, through: :user_units
  has_many :answers, dependent: :destroy

  validates :role, inclusion: { in: User::ROLES.keys.map(&:to_s) }

  def admin?
    role == "admin"
  end
end
