class AddAdminNotesToArtist < ActiveRecord::Migration
  def change
    add_column :artists, :admin_notes, :text
  end
end
