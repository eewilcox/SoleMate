class AddUserIdToShoes < ActiveRecord::Migration[5.0]
  def change
    add_column :shoes, :user_id, :integer
  end
end
