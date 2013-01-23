class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :fee_id, :null => false
      t.integer :order_id, :null => false

      t.timestamps
    end
  end
end
