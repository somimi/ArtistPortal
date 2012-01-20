class AddUrlToFilmSubmissions < ActiveRecord::Migration
  def change
    add_column :film_submissions, :url, :string
  end
end
