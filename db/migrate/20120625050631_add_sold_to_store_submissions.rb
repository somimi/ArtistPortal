class AddSoldToStoreSubmissions < ActiveRecord::Migration
  def change
    add_column :store_submissions, :quantity_sold, :integer
  end
end
