class AddArtistIdToLiterarySubmissions < ActiveRecord::Migration
  def change
    add_column :literary_submissions, :artist_id, :integer
  end
end
