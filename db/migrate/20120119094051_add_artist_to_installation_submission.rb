class AddArtistToInstallationSubmission < ActiveRecord::Migration
  def change
    add_column :installation_submissions, :artist_id, :integer
  end
end
