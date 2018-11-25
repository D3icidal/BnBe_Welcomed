class RenameHostsToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_table :hosts, :users
  end
end
