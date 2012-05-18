class AddReceivingFieldsToVisualSubmissions < ActiveRecord::Migration
  def change
    add_column :visual_submissions, :display_included, :bool
  end
end
