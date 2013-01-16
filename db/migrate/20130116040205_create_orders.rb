class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :artist_id, :null => false
      t.string :status, :null => false

      t.timestamps
    end
  end
end
