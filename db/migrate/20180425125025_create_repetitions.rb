class CreateRepetitions < ActiveRecord::Migration[5.1]
  def change
    create_table :repetitions do |t|
      t.references :survey
      t.integer :number
      t.string :rule
      t.integer :period_number
      t.string :period_rule
    end
  end
end
