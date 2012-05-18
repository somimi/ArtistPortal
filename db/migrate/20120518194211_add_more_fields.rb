class AddMoreFields < ActiveRecord::Migration
  def up
    add_column :visual_submissions, :received, :bool
  end

  def down
  end
end
