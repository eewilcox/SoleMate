class AddUserIdToShoesAgain < ActiveRecord::Migration[5.0]
  def change
    add_column :shoes, :user_id, :integer, null: false
  end
end
