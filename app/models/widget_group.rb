class WidgetGroup < ApplicationRecord
  belongs_to :widget

  validates :name, :probability, presence: true
end
