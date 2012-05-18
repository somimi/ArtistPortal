class AddEvenMoreColumns < ActiveRecord::Migration
  def up
    add_column :visual_submissions, :quality, :string
    add_column :visual_submissions, :quality_notes, :text
    add_column :visual_submissions, :packing_material, :bool
    add_column :visual_submissions, :packing_material_notes, :text
  end

  def down
  end
end
