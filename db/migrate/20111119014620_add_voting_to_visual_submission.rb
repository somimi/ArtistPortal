class AddVotingToVisualSubmission < ActiveRecord::Migration
  def change
    add_column :visual_submissions, :jury_five_vote, :integer
    add_column :visual_submissions, :average_vote, :integer
    add_column :visual_submissions, :acceptance_status, :string
    change_column :visual_submissions, :jury_one_vote, :integer
    change_column :visual_submissions, :jury_two_vote, :integer
    change_column :visual_submissions, :jury_three_vote, :integer
    change_column :visual_submissions, :jury_four_vote, :integer
  end
end
