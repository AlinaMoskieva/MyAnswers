class AddQuestionTypeToWidget < ActiveRecord::Migration[5.1]
  def change
    add_column :widgets, :question_type, :string, null: false, default: "number"
  end
end
