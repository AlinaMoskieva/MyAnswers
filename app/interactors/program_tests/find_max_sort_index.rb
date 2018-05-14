module ProgramTests
  class FindMaxSortIndex
    include Interactor

    delegate :program, to: :context

    def call
      context.sort_index = max_sort_index
    end

    private

    def max_sort_index
      program.program_tests.any? ? find_max_sort_index : 0.0
    end

    def find_max_sort_index
      program.program_tests.order(sort_index: :desc).first.try(:sort_index).to_f
    end
  end
end
