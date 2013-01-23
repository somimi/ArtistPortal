class AddDescriptionToFees < ActiveRecord::Migration
  def change
    add_column :fees, :description, :string
  end
end
