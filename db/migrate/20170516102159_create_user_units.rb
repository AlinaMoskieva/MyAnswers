class CreateUserUnits < ActiveRecord::Migration[5.0]
  def change
    create_table :user_units do |t|
      t.belongs_to :user, null: false, index: true, foreign_key: true
      t.belongs_to :unit, null: false, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
