class Repetition < ApplicationRecord
  AVALIABLE_RULES = %w[Неделя Месяц Год]

  validates :number, :rule, :period_number, :period_rule, presence: true
  belongs_to :test
end
