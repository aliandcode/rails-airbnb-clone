class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.date :checkin_date
      t.date :checkout_date
      t.integer :guests
      t.references :house, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
