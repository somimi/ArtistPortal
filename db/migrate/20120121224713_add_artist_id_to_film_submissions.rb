class AddArtistIdToFilmSubmissions < ActiveRecord::Migration
  def change
    add_column :film_submissions, :artist_id, :integer
  end
end
