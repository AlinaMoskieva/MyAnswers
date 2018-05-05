module Tests
  class FindMaxSortIndex
    include Interactor

    def call
      context.sort_index = max_sort_index
    end

    private

    def max_sort_index
      Test.order(sort_index: :desc).first.try(:sort_index).to_f
    end
  end
end
