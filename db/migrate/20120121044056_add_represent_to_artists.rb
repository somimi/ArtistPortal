class AddRepresentToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :represent_first_name, :string
    add_column :artists, :represent_last_name, :string
    add_column :artists, :represent_gallery, :string
  end
end
