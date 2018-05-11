class CreateQuestionTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :question_types do |t|
      t.references :question
      t.string :answer_type, null: false, default: "number"

      t.timestamps
    end
  end
end
