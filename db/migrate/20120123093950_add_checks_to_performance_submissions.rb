class AddChecksToPerformanceSubmissions < ActiveRecord::Migration
  def change
    add_column :performance_submissions, :mainstage_performance, :boolean
    add_column :performance_submissions, :ambient_performance, :boolean
  end
end
