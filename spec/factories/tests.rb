FactoryBot.define do
  factory :test do
    sequence(:name) { |n| "Test ##{n}" }
    sequence(:sort_index) { |n| n * 1.0 }
    complexity { "Средняя" }
    target_audience { {} }
  end
end
