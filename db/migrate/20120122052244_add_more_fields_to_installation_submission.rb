class AddMoreFieldsToInstallationSubmission < ActiveRecord::Migration
  def change
    add_column :installation_submissions, :want_funding, :boolean
    add_column :installation_submissions, :for_sale, :boolean
    add_column :installation_submissions, :price, :integer
  end
end
