class AddFieldsToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :answers_amount, :integer, default: 0, null: false
    add_column :questions, :right_answer, :text, default: "", null: false
    add_reference :questions, :unit, index: true, null: false
  end
end
