class ChangeDimensionColumn < ActiveRecord::Migration
  def up
	change_column :visual_submissions, :dimension, :boolean, :default => 0
  end

  def down
  end
end
