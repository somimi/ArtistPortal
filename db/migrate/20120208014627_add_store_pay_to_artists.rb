class AddStorePayToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :store_paid, :bool
  end
end
