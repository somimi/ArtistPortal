class AddTypeToLiterarySubmissions < ActiveRecord::Migration
  def change
    add_column :literary_submissions, :type, :string
  end
end
