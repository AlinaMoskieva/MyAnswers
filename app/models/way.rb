class Way < ApplicationRecord
  belongs_to :current_survey_question, class_name: "SurveyQuestion"
  belongs_to :next_survey_question, class_name: "SurveyQuestion"
end
