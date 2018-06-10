class Program < ApplicationRecord
  extend Enumerize

  has_many :program_tests, dependent: :destroy
  has_many :tests, through: :program_tests

  AVALIABLE_PROGRAM_EXECUTION_VALUES = %w(days_number program_day no_matter).freeze
end
