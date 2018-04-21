class CreateTestQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :test_questions do |t|
      t.references :test
      t.references :question
      t.references :widget
    end
  end
end
