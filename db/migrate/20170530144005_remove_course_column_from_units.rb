class RemoveCourseColumnFromUnits < ActiveRecord::Migration[5.0]
  def change
    remove_column :units, :course_id, :integer
  end
end
