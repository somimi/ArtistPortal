class AddShipFieldsToStoreSubmissions < ActiveRecord::Migration
  def change
    add_column :store_submissions, :quantity_received, :int
    add_column :store_submissions, :quality, :string
    add_column :store_submissions, :quality_notes, :text
    add_column :store_submissions, :display_included, :bool
    add_column :store_submissions, :display_notes, :text
    add_column :store_submissions, :packing_material, :bool
    add_column :store_submissions, :packing_material_notes, :text
  end
end
