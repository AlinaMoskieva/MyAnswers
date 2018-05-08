class Widget < ApplicationRecord
  validates :name, presence: true

  has_many :questions, through: :question_widgets
end
