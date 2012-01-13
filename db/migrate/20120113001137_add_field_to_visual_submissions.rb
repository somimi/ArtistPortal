class AddFieldToVisualSubmissions < ActiveRecord::Migration
  def change
    add_column :visual_submissions, :edition, :string
  end
end
