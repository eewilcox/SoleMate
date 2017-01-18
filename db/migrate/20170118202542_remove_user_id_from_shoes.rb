class RemoveUserIdFromShoes < ActiveRecord::Migration[5.0]
  def up
    remove_column :shoes, :user_id
  end

  def down
    add_column :shoes, :user_id, :integer
  end
end
