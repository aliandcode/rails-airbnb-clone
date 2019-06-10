class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :stars
      t.text :comment
      t.date :date
      t.references :booking, foreign_key: true

      t.timestamps
    end
  end
end
