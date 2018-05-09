class Widget < ApplicationRecord
  validates :name, :description, presence: true

  has_many :test_questions, dependent: :destroy
end
