class Unit < ApplicationRecord
  belongs_to :course

  validates :name, :course, presence: true
end
