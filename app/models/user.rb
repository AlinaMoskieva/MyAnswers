class User < ApplicationRecord
  extend Enumerize

  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable

  validates :full_name, presence: true

  enumerize :role, in: %w[user admin], predicates: true

  has_many :user_answers, dependent: :destroy
  has_many :unit_knowledges, dependent: :destroy
end
