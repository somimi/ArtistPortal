class RemoveRepresentativeNameFromArtists < ActiveRecord::Migration
  def up
	remove_column :artists, :represent_first_name
	remove_column :artists, :represent_last_name
  end

  def down
  end
end
