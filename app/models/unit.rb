class Unit < ApplicationRecord
  belongs_to :subject
  has_many :exercises, dependent: :destroy
  has_many :user_units, dependent: :destroy
  has_many :users, through: :user_units

  validates :name, :subject, :description, presence: true

  def last_exercises?(index)
    exercises.count == index
  end

  def next_exercise(index)
    exercises.find_by(index: index + 1)
  end
end
