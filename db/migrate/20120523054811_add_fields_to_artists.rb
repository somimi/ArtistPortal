class AddFieldsToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :store_shipped_with_visual, :bool
    add_column :artists, :paperwork_complete, :bool
    add_column :artists, :paperwork_notes, :text
  end
end
