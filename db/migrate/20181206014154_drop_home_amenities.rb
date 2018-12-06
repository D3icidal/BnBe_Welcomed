class DropHomeAmenities < ActiveRecord::Migration[5.2]
  def change
    drop_table :home_amenities
  end
end
