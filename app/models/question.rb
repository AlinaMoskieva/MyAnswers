class Question < ApplicationRecord
  has_many :widgets, through: :question_widgets

  validates :text, presence: true
end
