class RemoveNullFalseConditionFromExerciseAnswer < ActiveRecord::Migration[5.0]
  def change
    change_column_null :exercises, :answer, true
  end
end
