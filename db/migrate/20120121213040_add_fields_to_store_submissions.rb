class AddFieldsToStoreSubmissions < ActiveRecord::Migration
  def change
    add_column :store_submissions, :type, :string
    add_column :store_submissions, :type_other, :string
    add_column :store_submissions, :height, :integer
    add_column :store_submissions, :width, :integer
    add_column :store_submissions, :depth, :integer
    add_column :store_submissions, :h_unit, :string
    add_column :store_submissions, :w_unit, :string
    add_column :store_submissions, :d_unit, :string
    add_column :store_submissions, :price, :integer
    add_column :store_submissions, :presentation, :string
    add_column :store_submissions, :presentation_other, :string
    add_column :store_submissions, :provide_display, :boolean
    add_column :store_submissions, :notes, :text
  end
end
