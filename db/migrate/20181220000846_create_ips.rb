class CreateIps < ActiveRecord::Migration[5.2]
  def change
    create_table :ips do |t|
      t.integer :home_id
      t.string :ip

      t.timestamps
    end
  end
end
