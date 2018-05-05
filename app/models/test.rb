class Test < ApplicationRecord
  has_many :test_questions
  has_many :repetitions

  accepts_nested_attributes_for :repetitions, allow_destroy: true

  validates :name, presence: true

  before_save :define_sort_index

  def define_sort_index
    self.sort_index = Tests::FindMaxSortIndex.call.sort_index + 1
  end
end
