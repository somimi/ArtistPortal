class AddFilmToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :film_paid, :boolean
  end
end
