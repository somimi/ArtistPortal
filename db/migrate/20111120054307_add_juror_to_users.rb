class AddJurorToUsers < ActiveRecord::Migration
  def change
    add_column :users, :juror, :string
  end
end
