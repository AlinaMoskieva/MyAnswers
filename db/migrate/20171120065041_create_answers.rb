class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.string :text
      t.boolean :truthy, null: false
      t.references :question, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
