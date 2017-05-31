class CreateAnswerVariants < ActiveRecord::Migration[5.0]
  def change
    create_table :answer_variants do |t|
      t.string     "text" ,  null: false
      t.boolean    "truthy", null: false
      t.belongs_to :exercise, null: false

      t.timestamps null: false
    end
  end
end
