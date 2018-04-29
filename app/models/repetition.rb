class Repetition < ApplicationRecord
  validates :number, :rule, :period_number, :period_rule, presence: true
end
