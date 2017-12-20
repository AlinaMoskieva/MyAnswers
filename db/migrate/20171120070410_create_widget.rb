class CreateWidget < ActiveRecord::Migration[5.1]
  def change
    create_table :widgets do |t|
      t.string :name, null: false
      
      t.timestamps null: false
    end
  end
end
