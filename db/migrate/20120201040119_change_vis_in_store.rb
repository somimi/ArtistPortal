class ChangeVisInStore < ActiveRecord::Migration
  def up
    rename_column :store_submissions, :visual_submissions_id, :visual_submission_id
  end

  def down
  end
end
