class AddMoreFieldsMore < ActiveRecord::Migration
  def up
	add_column :visual_submissions, :display_notes, :text
  end

  def down
  end
end
