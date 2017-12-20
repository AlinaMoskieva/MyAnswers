class Question < ApplicationRecord
  belongs_to :module, class_name: "ThemeModule"

  has_many :user_answers, dependent: :destroy

  validates :text, :theory, :level, :index, presence: true
end
