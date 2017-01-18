class CreateShoes < ActiveRecord::Migration[5.0]
  def change
    create_table :shoes do |t|
      t.string :model, null: false
      t.string :version, null: false
      t.string :brand, null: false
      t.string :picture, null: false
      t.string :year, null: false
      t.decimal :price, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end
