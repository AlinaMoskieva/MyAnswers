class AddIndexToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :index, :integer
  end
end
