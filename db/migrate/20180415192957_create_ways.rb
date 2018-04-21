class CreateWays < ActiveRecord::Migration[5.1]
  def change
    create_table :ways do |t|
      t.references :current_question
      t.references :next_question
      t.boolean :right
    end
  end
end
