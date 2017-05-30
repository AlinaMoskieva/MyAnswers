class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  ROLES = {
    "user" => "user",
    "admin" => "admin"
  }.freeze

  has_many :subscriptions, dependent: :destroy
  has_many :user_units, dependent: :destroy
  has_many :courses, through: :subscriptions
  has_many :units, through: :user_units
  has_many :answers, dependent: :destroy

  validates :full_name, presence: true
  validates :role, inclusion: { in: User::ROLES.keys.map(&:to_s) }

  def admin?
    role == "admin"
  end
end
