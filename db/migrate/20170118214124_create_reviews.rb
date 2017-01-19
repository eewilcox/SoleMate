class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.belongs_to :shoe, null: false
      t.integer :rating, null: false
      t.text :description
      t.integer :votes, default: 0
      t.timestamps
    end
  end
end
