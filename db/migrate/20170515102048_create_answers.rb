class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.belongs_to :user, null: false, index: true, foreign_key: true
      t.belongs_to :exercise, null: false, index: true, foreign_key: true
      t.string :answer
      t.boolean :truthy, null: false

      t.timestamps null: false
    end
  end
end
