class AddVisualIdToStoreSubmissions < ActiveRecord::Migration
  def change
    add_column :store_submissions, :visual_submissions_id, :integer
  end
end
