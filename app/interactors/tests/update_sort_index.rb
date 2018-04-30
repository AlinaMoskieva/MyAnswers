module Tests
  class UpdateSortIndex
    include Interactor

    delegate :test, :step, to: :context
    delegate :sort_index, to: :test, prefix: true

    def call
      step == "+1" ? increase_sort_index : decrease_sort_index
    end

    private

    def increase_sort_index
      return if test_sort_index == max_sort_index

      next_test = Test.find_by(sort_index: test_sort_index + 1)

      test.update(sort_index: test_sort_index + 1)
      next_test.update(sort_index: next_test.sort_index - 1)
    end

    def decrease_sort_index
      return if test_sort_index == 1.0

      previous_test = Test.find_by(sort_index: test_sort_index - 1)

      test.update(sort_index: test_sort_index - 1)
      previous_test.update(sort_index: previous_test.sort_index + 1)
    end

    def max_sort_index
      Tests::FindMaxSortIndex.call.sort_index
    end
  end
end
