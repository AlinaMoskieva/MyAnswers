class Repetition < ApplicationRecord
  AVALIABLE_RULES = [
    I18n.t("activerecord.attributes.repetition.rule.week"),
    I18n.t("activerecord.attributes.repetition.rule.month"),
    I18n.t("activerecord.attributes.repetition.rule.year")
  ].freeze

  validates :number, :rule, :period_number, :period_rule, presence: true
  belongs_to :test
end
