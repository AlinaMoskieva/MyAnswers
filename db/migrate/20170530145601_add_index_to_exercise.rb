class AddIndexToExercise < ActiveRecord::Migration[5.0]
  def change
    add_column :exercises, :index, :integer, null: false
  end
end
