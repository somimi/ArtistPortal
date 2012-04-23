class AddArtReceivedToVisualSubmission < ActiveRecord::Migration
  def change
    add_column :visual_submissions, :art_received, :bool
  end
end
