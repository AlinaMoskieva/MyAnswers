class ChangeTestComplexityColumnType < ActiveRecord::Migration[5.1]
  def change
    change_column :tests, :complexity, :string, null: false, default: ""
  end
end
