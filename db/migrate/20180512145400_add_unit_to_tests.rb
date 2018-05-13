class AddUnitToTests < ActiveRecord::Migration[5.1]
  def change
    add_reference :tests, :unit, index: true, null: false
  end
end
