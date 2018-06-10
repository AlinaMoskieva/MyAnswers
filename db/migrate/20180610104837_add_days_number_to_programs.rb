class AddDaysNumberToPrograms < ActiveRecord::Migration[5.1]
  def change
    add_column :programs, :days_number, :integer
  end
end
