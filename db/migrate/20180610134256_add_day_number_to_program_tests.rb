class AddDayNumberToProgramTests < ActiveRecord::Migration[5.1]
  def change
    add_column :program_tests, :day_number, :integer
  end
end
