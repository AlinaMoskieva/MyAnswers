class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :description, null: false

      t.timestamps null: false
    end
  end
end
