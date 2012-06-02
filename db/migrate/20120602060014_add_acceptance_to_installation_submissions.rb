class AddAcceptanceToInstallationSubmissions < ActiveRecord::Migration
  def change
    add_column :installation_submissions, :acceptance_status, :string
  end
end
