class Topic < ApplicationRecord
  validates :name, presence: true

  belongs_to :parent, class_name: "Topic", optional: true
  has_many :children, class_name: "Topic", foreign_key: "parent_id", dependent: :destroy
end
