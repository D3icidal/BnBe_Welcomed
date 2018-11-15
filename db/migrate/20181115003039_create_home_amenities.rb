class CreateHomeAmenities < ActiveRecord::Migration[5.2]
  def change
    create_table :home_amenities do |t|
      t.integer :home_id
      t.integer :amenity_id
      t.boolean :is_usable
      t.string :location
      t.text :instructions

      t.timestamps
    end
  end
end
