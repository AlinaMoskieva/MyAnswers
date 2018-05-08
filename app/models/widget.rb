class Widget < ApplicationRecord
  validates :name, :description, presence: true

  has_many :questions, through: :question_widgets
end
