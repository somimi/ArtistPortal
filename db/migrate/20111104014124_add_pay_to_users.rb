class AddPayToUsers < ActiveRecord::Migration
  def change
    add_column :users, :paid_visual, :boolean
    add_column :users, :paid_literary, :boolean
  end
end
