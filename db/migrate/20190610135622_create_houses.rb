class CreateHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :houses do |t|
      t.string :title
      t.text :description
      t.string :address
      t.integer :price
      t.integer :bedrooms
      t.integer :capacity
      t.string :photo
      t.string :category
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
