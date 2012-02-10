class AddStorePayToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :store_paid, :bool
    add_column :artists, :test, :bool
  end
end
