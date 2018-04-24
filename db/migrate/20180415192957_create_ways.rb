class CreateWays < ActiveRecord::Migration[5.1]
  def change
    create_table :ways do |t|
      t.references :current_survey_question
      t.references :next_survey_question
      t.boolean :right
    end
  end
end
