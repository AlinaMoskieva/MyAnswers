class AddDescriptionToWidget < ActiveRecord::Migration[5.1]
  def change
    add_column :widgets, :description, :string, null: false, default: ""
  end
end
