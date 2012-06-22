class AddQuantityShippedToStoreSubmissions < ActiveRecord::Migration
  def change
    add_column :store_submissions, :quantity_returned, :integer
  end
end
