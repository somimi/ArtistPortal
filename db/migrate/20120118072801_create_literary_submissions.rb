class CreateLiterarySubmissions < ActiveRecord::Migration
  def change
    create_table :literary_submissions do |t|
      t.string :title
      t.text :comments

      t.timestamps
    end
  end
end
