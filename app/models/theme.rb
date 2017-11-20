class Theme < ApplicationRecord
  has_many :modules, class_name: "ThemeModule", dependent: :destroy

  validates :name, presence: true
end
