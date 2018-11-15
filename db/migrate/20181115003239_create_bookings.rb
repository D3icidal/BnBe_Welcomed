class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.integer :home_id
      t.date :checkin
      t.date :checkout
      t.string :checkout_reason

      t.timestamps
    end
  end
end
