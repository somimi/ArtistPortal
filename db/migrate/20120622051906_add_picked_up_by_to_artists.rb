class AddPickedUpByToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :pickedup_by, :string
  end
end
