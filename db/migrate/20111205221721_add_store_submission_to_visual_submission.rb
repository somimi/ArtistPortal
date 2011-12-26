class AddStoreSubmissionToVisualSubmission < ActiveRecord::Migration
  def change
    add_column :visual_submissions, :store_submit, :boolean
  end
end
