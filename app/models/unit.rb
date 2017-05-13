class Unit < ApplicationRecord
  belongs_to :course
  has_many :exercises

  validates :name, :course, presence: true
end
