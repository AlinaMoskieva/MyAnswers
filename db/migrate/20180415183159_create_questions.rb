class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :text, null: false, default: ""
      t.string :theory
    end
  end
end
