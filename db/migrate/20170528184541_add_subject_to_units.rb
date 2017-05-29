class AddSubjectToUnits < ActiveRecord::Migration[5.0]
  def change
    add_column :units, :subject_id, :integer, null: false
  end
end
