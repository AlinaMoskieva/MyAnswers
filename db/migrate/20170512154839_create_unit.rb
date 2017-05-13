class CreateUnit < ActiveRecord::Migration[5.0]
  def change
    create_table :units do |t|
      t.belongs_to :course, null: false
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
