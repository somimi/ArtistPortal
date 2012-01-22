class AddRepresentBackToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :representname, :string
  end
end
