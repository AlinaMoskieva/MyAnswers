class CreateExercises < ActiveRecord::Migration[5.0]
  def change
    create_table :exercises do |t|
      t.belongs_to :unit, null: false
      t.string :question, null: false
      t.string :answer, null: false
      t.text :theory

      t.timestamps
    end
  end
end
