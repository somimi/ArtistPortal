class AddWallCardToVisualSubmissions < ActiveRecord::Migration
  def change
    add_column :visual_submissions, :wall_card_description, :string
  end
end
