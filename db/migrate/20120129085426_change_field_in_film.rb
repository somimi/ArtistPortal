class ChangeFieldInFilm < ActiveRecord::Migration
  def up
	change_column :film_submissions, :duration, :string
  end

  def down
  end
end
