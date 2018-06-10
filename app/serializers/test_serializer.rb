class TestSerializer < BaseSerializer
  attributes :id, :name, :complexity, :target_audience, :sort_index, :program_test_id,
    :increase_index_link_avaliable?, :decrease_index_link_avaliable?

  def increase_index_link_avaliable?
    program_test.sort_index != max_sort_index
  end

  def decrease_index_link_avaliable?
    program_test.sort_index != min_sort_index
  end

  def program_test_id
    program_test.id
  end

  private

  def program_test
    object.program_tests.find_by(program: program)
  end

  def program
    @program ||= @instance_options[:program]
  end

  def max_sort_index
    @max_sort_index ||= ProgramTests::FindMaxSortIndex.call(program: Program.find(program.id)).sort_index
  end

  def min_sort_index
    @min_sort_index ||= ProgramTests::FindMinSortIndex.call(program: Program.find(program.id)).sort_index
  end
end
