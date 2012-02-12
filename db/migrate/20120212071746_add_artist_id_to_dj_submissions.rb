class AddArtistIdToDjSubmissions < ActiveRecord::Migration
  def change
    add_column :dj_submissions, :artist_id, :integer
  end
end
