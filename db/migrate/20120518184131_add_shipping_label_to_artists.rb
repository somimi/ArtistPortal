class AddShippingLabelToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :shipping_label, :bool
  end
end
