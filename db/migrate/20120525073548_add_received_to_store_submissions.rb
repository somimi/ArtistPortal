class AddReceivedToStoreSubmissions < ActiveRecord::Migration
  def change
    add_column :store_submissions, :received, :bool
  end
end
