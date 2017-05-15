class AddColumnDescriptionToUnits < ActiveRecord::Migration[5.0]
  def change
    add_column :units, :description, :string, null: false
  end
end
