FactoryBot.define do
  factory :topic do
    name { Faker::Lorem.word }
    parent nil
  end

  trait :with_parent do
    association :parent, factory: :topic
  end
end
