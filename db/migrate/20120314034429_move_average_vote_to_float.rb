class MoveAverageVoteToFloat < ActiveRecord::Migration
  def up
   change_column :visual_submissions, :average_vote, :float, :default => 0
  end

  def down
  end
end
