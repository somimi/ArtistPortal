class AddAdminNotesToStoreSubmissions < ActiveRecord::Migration
  def change
    add_column :store_submissions, :admin_notes, :text
  end
end
