class Widget < ApplicationRecord
  has_many :test_questions

  validates :name, presence: true
end
