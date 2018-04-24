class CreateTests < ActiveRecord::Migration[5.1]
  def change
    create_table :surveys do |t|
      t.string :name, null: false, default: ""
      t.integer :complexity, default: 0
      t.json :target_audience, default: {}
    end
  end
end
