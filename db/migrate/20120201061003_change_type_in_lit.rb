class ChangeTypeInLit < ActiveRecord::Migration
  def up
    rename_column :literary_submissions, :type, :lit_type
  end

  def down
  end
end
