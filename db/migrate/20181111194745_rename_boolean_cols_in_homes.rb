class RenameBooleanColsInHomes < ActiveRecord::Migration[5.2]
  def change
    rename_column :homes, :status, :is_active
    remove_column :homes, :parking?, :boolean
  end
end
