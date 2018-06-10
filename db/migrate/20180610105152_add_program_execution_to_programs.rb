class AddProgramExecutionToPrograms < ActiveRecord::Migration[5.1]
  def change
    add_column :programs, :execution, :string
  end
end
