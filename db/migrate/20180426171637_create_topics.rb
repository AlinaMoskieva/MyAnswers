class CreateTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :topics do |t|
      t.string :name, null: false, default: ""
      t.references :parent, index: true

      t.timestamps
    end
  end
end
