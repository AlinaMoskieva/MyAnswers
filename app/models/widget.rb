class Widget < ApplicationRecord
  has_many :questions, through: :question_widgets

  validates :name, presence: true
end
