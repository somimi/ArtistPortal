class AddShipperToArtist < ActiveRecord::Migration
  def change
    add_column :artists, :shipping_company, :string
  end
end
