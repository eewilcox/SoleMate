class RenameVotesToTalliesInReviews < ActiveRecord::Migration[5.0]
  def change
    rename_column :reviews, :votes, :tally
  end
end
