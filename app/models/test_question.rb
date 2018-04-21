class TestQuestion < ApplicationRecord
  belongs_to :question
  belongs_to :widget
  belongs_to :test
end
