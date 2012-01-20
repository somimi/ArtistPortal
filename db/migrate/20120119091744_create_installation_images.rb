class CreateInstallationImages < ActiveRecord::Migration
  def change
    create_table :installation_images do |t|
      t.string :installation_image_file_name
      t.string :installation_image_content_type
      t.integer :installation_image_file_size
      t.datetime :installation_image_updated_at
      t.integer :installation_submission_id

      t.timestamps
    end
  end
end
