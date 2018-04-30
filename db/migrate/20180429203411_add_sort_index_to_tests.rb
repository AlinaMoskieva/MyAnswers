class AddSortIndexToTests < ActiveRecord::Migration[5.1]
  def change
    add_column :tests, :sort_index, :float, default: "1.0", null: false
  end
end
