class CreateArtists < ActiveRecord::Migration
  def self.up
    create_table :artists do |t|
      t.string :first_name
      t.string :last_name
      t.integer :user_id
      t.boolean :visual_paid
      t.boolean :literary_paid
      t.string :professional_name
      t.string :email
      t.string :phone
      t.string :mailing_address_line1
      t.string :mailing_address_line2
      t.string :mailing_city
      t.string :mailing_zip
      t.string :shipping_address_line1
      t.string :shipping_address_line2
      t.string :shipping_city
      t.string :shipping_zip
      t.string :shipping_state
      t.string :mailing_state
      t.string :shipping_country
      t.string :mailing_country
      t.boolean :shipping_same_as_mail
      t.string :shipping_account
      t.text :bio
      t.boolean :require_representation
      t.timestamps
    end
  end

  def self.down
    drop_table :artists
  end
end
