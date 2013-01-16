class CreateFees < ActiveRecord::Migration
  def change
    create_table :fees do |t|
      t.string :name
      t.integer :amount
      t.boolean :active, :default => true

      t.timestamps
    end
  end
end
