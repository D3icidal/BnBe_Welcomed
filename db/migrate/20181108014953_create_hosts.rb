class CreateHosts < ActiveRecord::Migration[5.2]
  def change
    create_table :hosts do |t|
      t.string :email
      t.string :phone
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.text :bio
      t.string :image_url
      t.string :ip

      t.timestamps
    end
  end
end
