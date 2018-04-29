class User < ApplicationRecord
  extend Enumerize
  extend ActiveModel::Naming

  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable

  validates :full_name, presence: true

  enumerize :role, in: %w(user admin), predicates: true
end
