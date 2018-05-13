class AddNameToPrograms < ActiveRecord::Migration[5.1]
  def change
    add_column :programs, :name, :string, null: false
  end
end
