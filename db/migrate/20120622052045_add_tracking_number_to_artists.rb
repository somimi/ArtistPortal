class AddTrackingNumberToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :tracking_number, :string
  end
end
