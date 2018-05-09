class CreateUserAnswer < ActiveRecord::Migration[5.1]
  def change
    create_table :user_answers do |t|
      t.string :answer, default: "", null: false
      t.boolean :truthy, default: false, null: false
      t.references :user
      t.references :test_question

      t.timestamps
    end
  end
end
