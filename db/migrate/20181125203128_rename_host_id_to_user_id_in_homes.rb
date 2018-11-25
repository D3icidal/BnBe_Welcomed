class RenameHostIdToUserIdInHomes < ActiveRecord::Migration[5.2]
  def change
    rename_column :homes, :host_id, :user_id
  end
end
