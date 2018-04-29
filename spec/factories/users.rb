FactoryBot.define do
  factory :user do
    email
    full_name { Faker::Name.name }
    password "password"
    password_confirmation { password }
    confirmed_at 1.hour.ago
    role "user"

    trait :admin do
      role "admin"
    end

    trait :not_confirmed do
      confirmed_at nil

      after(:create) do |user|
        user.update(confirmation_sent_at: 3.days.ago)
      end
    end
  end
end
