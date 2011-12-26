class CreateStoreSubmissions < ActiveRecord::Migration
  def self.up
    create_table :store_submissions do |t|
      t.integer :artist_id
      t.string :title
      t.string :description
      t.string :quantity
      t.string :quantity_accepted
      t.boolean :accepted
      t.timestamps
    end
  end

  def self.down
    drop_table :store_submissions
  end
end
