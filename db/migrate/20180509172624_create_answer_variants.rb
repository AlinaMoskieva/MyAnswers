class CreateAnswerVariants < ActiveRecord::Migration[5.1]
  def change
    create_table :answer_variants do |t|
      t.string :content, null: false
      t.boolean :truthy, default: false, null: false
      t.references :test_question

      t.timestamps
    end
  end
end
