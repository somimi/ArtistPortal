class AddArtistIdToVisualSubmission < ActiveRecord::Migration
  def change
    add_column :visual_submissions, :artist_id, :integer
  end
end
