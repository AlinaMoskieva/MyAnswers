class Program < ApplicationRecord
  has_many :program_tests
  has_many :tests, through: :program_tests
end
