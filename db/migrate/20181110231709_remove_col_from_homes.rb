class RemoveColFromHomes < ActiveRecord::Migration[5.2]
  def change
    add_column :homes, :comment_id, :string
    remove_column :homes, :guest_expires, :date
    rename_column :homes, :address, :street_address
    add_column :homes, :state, :string
    remove_column :homes, :smart_wifi?, :boolean
    remove_column :homes, :smart_thermastat?, :boolean
    remove_column :homes, :private_parking_instructions, :text
    remove_column :homes, :street_parking_instructions, :text
  end
end
