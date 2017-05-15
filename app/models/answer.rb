class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :exercise

  validates :user, :exercise, :truthy, presence: true
end
