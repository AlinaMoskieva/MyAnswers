class AddQuestionTypeToTestQuestion < ActiveRecord::Migration[5.1]
  def change
    add_reference :test_questions, :question_type
  end
end
