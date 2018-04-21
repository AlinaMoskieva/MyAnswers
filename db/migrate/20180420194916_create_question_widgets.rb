class CreateQuestionWidgets < ActiveRecord::Migration[5.1]
  def change
    create_table :question_widgets do |t|
      t.references :question
      t.references :widget
    end
  end
end
