class CreateUnitKnowledges < ActiveRecord::Migration[5.1]
  def change
    create_table :unit_knowledges do |t|
      t.float :value, null: false, default: 0.0
      t.references :user
      t.references :unit
    end
  end
end
