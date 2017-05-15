class Unit < ApplicationRecord
  belongs_to :course
  has_many :exercises, dependent: :destroy

  validates :name, :course, presence: true
end
