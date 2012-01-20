class AddInstallationPaidToArtist < ActiveRecord::Migration
  def change
    add_column :artists, :installation_paid, :boolean
  end
end
