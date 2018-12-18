class CreateSections < ActiveRecord::Migration[5.2]
  def change
    create_table :sections do |t|
      t.string :name
      t.string :image_url
      t.integer :home_id
      t.text :content

      t.timestamps
    end
  end
end
