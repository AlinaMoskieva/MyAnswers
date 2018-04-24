class CreateTestQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :survey_questions do |t|
      t.references :survey
      t.references :question
      t.references :widget
    end
  end
end
