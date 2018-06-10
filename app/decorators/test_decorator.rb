class TestDecorator < ApplicationDecorator
  delegate :id, :name, :complexity

  decorates_association :test_questions
  decorates_association :repetitions

  def day_number(program)
    pt = program_test(program)

    pt.day_number
  end

  def increase_index_link_avaliable?(program)
    pt = program_test(program)

    pt.sort_index != max_sort_index
  end

  def decrease_index_link_avaliable?(program)
    pt = program_test(program)

    pt.sort_index != min_sort_index
  end

  def program_test_id(program)
    program_test(program).id
  end

  private

  def program_test(program)
    object.program_tests.find_by(program: program)
  end

  def max_sort_index
    @max_sort_index ||= ProgramTests::FindMaxSortIndex.call(program: Program.find(object.program_id)).sort_index
  end

  def min_sort_index
    @min_sort_index ||= ProgramTests::FindMinSortIndex.call(program: Program.find(object.program_id)).sort_index
  end
end
