class Widget < ApplicationRecord
  has_many :widget_groups

  validates :name, presence: true
end
