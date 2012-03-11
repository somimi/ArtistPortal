class AddAcceptanceToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :acceptance_status, :int, :default => 0;
  end
end
