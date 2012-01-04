class DropAssets < ActiveRecord::Migration
  def up
     drop_table :assets
  end

  def down
  end
end
