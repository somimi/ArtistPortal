class AddStatusToVisualSubmission < ActiveRecord::Migration
  def change
    add_column :visual_submissions, :return_status, :string
  end
end
