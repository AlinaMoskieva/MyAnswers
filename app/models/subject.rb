class Subject < ApplicationRecord
  belongs_to :course
  has_many :units, dependent: :destroy

  validates :name, :course, presence: true
  validates :name, uniqueness: true
end
