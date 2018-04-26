class Topic < ApplicationRecord
  validates :name, presence: true

  belongs_to :parent, class_name: "Topic", optional: true
end
