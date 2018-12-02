class AddBookingCodeToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :code, :string
  end
end
