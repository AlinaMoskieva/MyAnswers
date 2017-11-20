class CreateModules < ActiveRecord::Migration[5.1]
  def change
    create_table :theme_modules do |t|
      t.belongs_to :theme, index: true, foreign_key: true
      t.string :name, null: false
      t.text :description

      t.timestamps null: false
    end
  end
end
