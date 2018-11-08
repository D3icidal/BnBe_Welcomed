class CreateHomes < ActiveRecord::Migration[5.2]
  def change
    create_table :homes do |t|
      t.integer :host_id
      t.string :name
      t.string :status
      t.string :wifi_password
      t.string :guest_password
      t.date :guest_expires
      t.string :address
      t.string :zipcode
      t.integer :bedrooms
      t.integer :bathrooms
      t.boolean :parking?
      t.boolean :smart_wifi?
      t.boolean :smart_thermastat?
      t.text :private_parking_instructions
      t.text :street_parking_instructions

      t.timestamps
    end
  end
end
