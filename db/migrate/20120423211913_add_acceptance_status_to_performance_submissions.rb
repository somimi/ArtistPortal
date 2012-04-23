class AddAcceptanceStatusToPerformanceSubmissions < ActiveRecord::Migration
  def change
    add_column :performance_submissions, :acceptance_status, :string
  end
end
