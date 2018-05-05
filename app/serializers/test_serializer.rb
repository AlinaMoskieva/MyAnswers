class TestSerializer < BaseSerializer
  attributes :id, :name, :complexity, :target_audience, :sort_index,
    :increase_index_link_avaliable?, :decrease_index_link_avaliable?

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
