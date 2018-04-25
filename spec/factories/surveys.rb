FactoryBot.define do
  factory :survey do
    sequence(:name) { |n| "Test ##{n}" }
    complexity { Faker::Number.between(1, 10) }
    target_audience { {} }
  end
end
