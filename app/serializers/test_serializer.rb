class TestSerializer < BaseSerializer
  attributes :id, :name, :complexity, :target_audience, :sort_index, :program_test_id, :sort_index,
    :increase_index_link_avaliable?, :decrease_index_link_avaliable?, :day_number

  def day_number
    return unless program

    program_test.day_number
  end

  def increase_index_link_avaliable?
    return unless program

    program_test.sort_index != max_sort_index
  end

  def decrease_index_link_avaliable?
    return unless program

    program_test.sort_index != min_sort_index
  end

  def program_test_id
    return unless program

    program_test.id
  end

  private

  def program_test
    object.program_tests.find_by(program: program, sort_index: object.sort_index)
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
