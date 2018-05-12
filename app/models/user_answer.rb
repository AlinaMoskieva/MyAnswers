class UserAnswer < ApplicationRecord
  validates :truthy, inclusion: [true, false]

  belongs_to :test_question
  belongs_to :user
  belongs_to :test
end
