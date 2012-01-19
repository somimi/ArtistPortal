class AddShippingStuffToArtist < ActiveRecord::Migration
  def change
    add_column :artists, :delivery_arrangements, :string
    add_column :artists, :return_arrangements, :string
  end
end
