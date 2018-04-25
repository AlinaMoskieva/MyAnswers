class CreateTests < ActiveRecord::Migration[5.1]
  def change
    create_table :tests do |t|
      t.string :name, null: false, default: ""
      t.string :complexity, default: ""
      t.json :target_audience, default: {}
    end
  end
end
