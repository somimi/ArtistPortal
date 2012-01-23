class AddDimensionToStoreSubmissions < ActiveRecord::Migration
  def change
    add_column :store_submissions, :dimension, :boolean
  end
end
