class CreateWidgetGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :widget_groups do |t|
      t.string :name, null: false
      t.decimal :probability, null: false, default: 0.0
      t.references :widget, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
