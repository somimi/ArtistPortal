class RemoveColumnFromArtists < ActiveRecord::Migration
  def up
   remove_column :artists, :paid_literary
   remove_column :artists, :paid_visual
  end

  def down
  end
end
