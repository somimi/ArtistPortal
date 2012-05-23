class AddMaterialToVisualSubmissions < ActiveRecord::Migration
  def change
    add_column :visual_submissions, :packing_material_included, :bool
  end
end
