module ProgramTests
  class FindMinSortIndex
    include Interactor

    delegate :program, to: :context

    def call
      context.sort_index = min_sort_index
    end

    private

    def min_sort_index
      program.program_tests.any? ? find_min_sort_index : nil
    end

    def find_min_sort_index
      program.program_tests.order(sort_index: :desc).last.try(:sort_index).to_f
    end
  end
end
