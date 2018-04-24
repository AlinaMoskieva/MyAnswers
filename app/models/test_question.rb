class SurveyQuestion < ApplicationRecord
  belongs_to :question
  belongs_to :widget
  belongs_to :survey
end
