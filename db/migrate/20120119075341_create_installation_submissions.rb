class CreateInstallationSubmissions < ActiveRecord::Migration
  def change
    create_table :installation_submissions do |t|
      t.string :title
      t.text :description
      t.integer :height
      t.string :h_unit
      t.integer :width
      t.string :w_unit
      t.integer :depth
      t.string :d_unit

      t.timestamps
    end
  end
end
