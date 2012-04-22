class AddAcceptanceStatusToFilmSubmissions < ActiveRecord::Migration
  def change
    add_column :film_submissions, :acceptance_status, :string
    add_column :literary_submissions, :acceptance_status, :string
  end
end
