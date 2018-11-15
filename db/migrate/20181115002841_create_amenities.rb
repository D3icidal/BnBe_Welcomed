class CreateAmenities < ActiveRecord::Migration[5.2]
  def change
    create_table :amenities do |t|
      t.string :name
      t.string :icon_url
      t.text :generic_instructions

      t.timestamps
    end
  end
end
