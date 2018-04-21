FactoryBot.define do
  sequence(:email) { Faker::Internet.email }
  sequence(:title) { |n| "#{Faker::Lorem.words} #{n}" }
  sequence(:text) { |n| "Question ##{n}" }
end
