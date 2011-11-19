class ChangeUpdateToArtists < ActiveRecord::Migration
  def up
    add_column :artists, :paid_literary, :bool
    add_column :artists, :paid_visual, :bool
    remove_column :users, :paid_visual
    remove_column :users, :paid_literary
  end

  def down
  end
end
