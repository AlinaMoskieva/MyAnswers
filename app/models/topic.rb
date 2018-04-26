class Topic < ApplicationRecord
  extend ActsAsTree::TreeWalker

  acts_as_tree order: "name"

  validates :name, presence: true

  belongs_to :parent, class_name: "Topic", optional: true
  has_many :children, class_name: "Topic", foreign_key: "parent_id", dependent: :destroy

  def has_parent?
    parent.present?
  end

  def has_children?
    children.present?
  end
end
