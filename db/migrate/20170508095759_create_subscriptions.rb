class CreateSubscriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :subscriptions do |t|
      t.belongs_to :user, null: false
      t.belongs_to :course, null: false

      t.timestamps null: false
    end
  end
end
