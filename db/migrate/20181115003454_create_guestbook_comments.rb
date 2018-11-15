class CreateGuestbookComments < ActiveRecord::Migration[5.2]
  def change
    create_table :guestbook_comments do |t|
      t.integer :home_id

      t.timestamps
    end
  end
end
