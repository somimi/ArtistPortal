class ChangeStatusVisualSubmissions < ActiveRecord::Migration
  def up
	change_column :visual_submissions, :acceptance_status, :string, :default => "undecided"
  end

  def down
  end
end
