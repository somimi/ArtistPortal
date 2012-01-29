class AddCheckToVisualSubmissions < ActiveRecord::Migration
  def change
    add_column :visual_submissions, :donate_proceeds, :boolean
  end
end
