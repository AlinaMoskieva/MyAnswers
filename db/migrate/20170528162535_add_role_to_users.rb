class AddRoleToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :role, :string

    User.update_all(role: "user")

    change_column_null :users, :role, false
  end
end
