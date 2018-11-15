class RestructureAmenities < ActiveRecord::Migration[5.2]
  def change
    rename_column :amenities, :generic_instructions, :instructions
    add_column :amenities, :location, :string
    add_column :amenities, :is_usable, :boolean
    add_column :amenities, :home_id, :integer
  end
end
