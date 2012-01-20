class CreateFilmSubmissions < ActiveRecord::Migration
  def change
    create_table :film_submissions do |t|
      t.string :title
      t.text :description
      t.integer :duration
      t.string :delivery_type

      t.timestamps
    end
  end
end
