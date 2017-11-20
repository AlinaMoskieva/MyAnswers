class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :text, null: false
      t.text :theory, null: false
      t.integer :level, null: false
      t.integer :index, null: false
      t.references :theme_module, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
