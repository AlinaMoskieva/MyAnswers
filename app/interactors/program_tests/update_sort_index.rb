module ProgramTests
  class UpdateSortIndex
    include Interactor

    delegate :program_test, :step, to: :context
    delegate :sort_index, :program, to: :program_test, prefix: true

    def call
      step == "+1" ? increase_sort_index : decrease_sort_index
    end

    private

    def increase_sort_index
      return if program_test_sort_index == max_sort_index

      next_program_test = ProgramTest.where("sort_index > ?", program_test_sort_index).order(sort_index: :asc).first
      next_program_test_sort_index = next_program_test.sort_index

      next_program_test.update(sort_index: program_test_sort_index)
      program_test.update(sort_index: next_program_test_sort_index)
    end

    def decrease_sort_index
      return if program_test_sort_index == min_sort_index

      previous_program_test = ProgramTest.where("sort_index < ?", program_test_sort_index).order(sort_index: :asc).last
      previous_program_test_sort_index = previous_program_test.sort_index

      previous_program_test.update(sort_index: program_test_sort_index)
      program_test.update(sort_index: previous_program_test_sort_index)
    end

    def max_sort_index
      ProgramTests::FindMaxSortIndex.call(program: program_test_program).sort_index
    end

    def min_sort_index
      ProgramTests::FindMinSortIndex.call(program: program_test_program).sort_index
    end
  end
end
