class CreateVisualSubmissions < ActiveRecord::Migration
  def self.up
    create_table :visual_submissions do |t|
      t.string :title
      t.string :medium
      t.string :dimension
      t.string :height
      t.string :width
      t.string :depth
      t.string :h_unit
      t.string :w_unit
      t.string :d_unit
      t.string :year_created
      t.integer :sale_price
      t.text :notes
      t.datetime :received_date
      t.datetime :pickedup_date
      t.string :pickedup_by
      t.datetime :shipped_date
      t.string :shipped_carrier
      t.string :shipped_tracking
      t.boolean :limited_edition
      t.integer :edition_position
      t.integer :edition_total
      t.string :jury_one_vote
      t.string :jury_two_vote
      t.string :jury_three_vote
      t.string :jury_four_vote
      t.timestamps
    end
  end

  def self.down
    drop_table :visual_submissions
  end
end
