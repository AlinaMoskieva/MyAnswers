class TestDecorator < ApplicationDecorator
  delegate :id, :name, :complexity

  decorates_association :test_questions
  decorates_association :repetitions

  def increase_index_link_avaliable?
    object.sort_index != max_sort_index
  end

  def decrease_index_link_avaliable?
    object.sort_index != 1.0
  end

  private

  def max_sort_index
    @max_sort_index ||= Tests::FindMaxSortIndex.call.sort_index
  end
end
