class AddArtistIdToPerformanceSubmissions < ActiveRecord::Migration
  def change
    add_column :performance_submissions, :artist_id, :integer
  end
end
