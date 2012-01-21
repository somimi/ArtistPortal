class CreateDjSubmissions < ActiveRecord::Migration
  def change
    create_table :dj_submissions do |t|
      t.string :musical_style
      t.text :other_music
      t.text :live_links
      t.text :career
      t.boolean :six_16_day
      t.boolean :six_17_day
      t.boolean :six_22_day
      t.boolean :six_23_day
      t.boolean :six_24_day
      t.boolean :six_16_evening
      t.boolean :six_17_evening
      t.boolean :six_22_evening
      t.boolean :six_23_evening
      t.boolean :six_24_evening
      t.boolean :six_16_night
      t.boolean :six_22_night
      t.boolean :six_23_night
      t.text :want_to_play
      t.text :gear_requirements
      t.text :festival_history
      t.text :additional_notes

      t.timestamps
    end
  end
end
