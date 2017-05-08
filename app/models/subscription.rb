class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :course

  validates :user, :course, presence: true
  validates :user, uniqueness: { scope: :course }
end
