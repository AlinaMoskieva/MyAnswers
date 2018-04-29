class CreateRepetitions < ActiveRecord::Migration[5.1]
  def change
    create_table :repetitions do |t|
      t.references :test
      t.integer :number
      t.string :rule
      t.integer :period_number
      t.string :period_rule
    end
  end
end
