class RemoveRoleFromUsers < ActiveRecord::Migration[5.0]
  def up
    remove_column :users, :role
  end

  def down
    add_column :users, :role, :string, default: "member", null: false
  end
end
