class Topic < ApplicationRecord
  extend ActsAsTree::TreeWalker

  acts_as_tree order: "name"

  validates :name, presence: true

  belongs_to :parent, class_name: "Topic", optional: true
  has_many :children, class_name: "Topic", foreign_key: "parent_id", dependent: :destroy
  has_many :units, dependent: :destroy

  def parent?
    parent.present?
  end

  def children?
    children.present?
  end
end
