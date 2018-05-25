class TestDecorator < ApplicationDecorator
  delegate :id, :name, :complexity

  decorates_association :test_questions
  decorates_association :repetitions

  def increase_index_link_avaliable?
    # object.sort_index != max_sort_index

    false
  end

  def decrease_index_link_avaliable?
    # object.sort_index != min_sort_index

    false
  end

  private

  def max_sort_index
    @max_sort_index ||= ProgramTests::FindMaxSortIndex.call(program: Program.find(object.program_id)).sort_index
  end

  def min_sort_index
    @min_sort_index ||= ProgramTests::FindMinSortIndex.call(program: Program.find(object.program_id)).sort_index
  end
end
