class CreatePerformanceSubmissions < ActiveRecord::Migration
  def change
    create_table :performance_submissions do |t|
      t.string :title
      t.integer :duration
      t.text :description
      t.string :type
      t.text :stage_requirements
      t.text :performance_experience
      t.text :bio
      t.string :url1
      t.string :url2
      t.string :url3

      t.timestamps
    end
  end
end
