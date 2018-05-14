class CreateProgramTests < ActiveRecord::Migration[5.1]
  def change
    create_table :program_tests do |t|
      t.references :program, foreign_key: true
      t.references :test, foreign_key: true
    end
  end
end
