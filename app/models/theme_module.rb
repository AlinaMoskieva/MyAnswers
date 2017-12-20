class ThemeModule < ApplicationRecord
  belongs_to :theme

  has_many :questions, dependent: :destroy

  validates :name, presence: true
end
