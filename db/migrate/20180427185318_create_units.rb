class CreateUnits < ActiveRecord::Migration[5.1]
  def change
    create_table :units do |t|
      t.string :name, null: false, default: ""
      t.references :topic

      t.timestamps
    end
  end
end
