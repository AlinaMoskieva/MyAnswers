class AddInScenarioToTestQuestion < ActiveRecord::Migration[5.1]
  def change
    add_column :test_questions, :in_scenario, :boolean, null: false, default: false
  end
end
