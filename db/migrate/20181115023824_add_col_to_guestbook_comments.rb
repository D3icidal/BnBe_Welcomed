class AddColToGuestbookComments < ActiveRecord::Migration[5.2]
  def change
    add_column :guestbook_comments, :name, :string
    add_column :guestbook_comments, :comment, :text
  end
end
