# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120121044056) do

  create_table "artists", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "user_id"
    t.boolean  "visual_paid"
    t.boolean  "literary_paid"
    t.string   "professional_name"
    t.string   "email"
    t.string   "phone"
    t.string   "mailing_address_line1"
    t.string   "mailing_address_line2"
    t.string   "mailing_city"
    t.string   "mailing_zip"
    t.string   "shipping_address_line1"
    t.string   "shipping_address_line2"
    t.string   "shipping_city"
    t.string   "shipping_zip"
    t.string   "shipping_state"
    t.string   "mailing_state"
    t.string   "shipping_country"
    t.string   "mailing_country"
    t.boolean  "shipping_same_as_mail"
    t.string   "shipping_account"
    t.text     "bio"
    t.boolean  "require_representation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "shipping_company"
    t.string   "delivery_arrangements"
    t.string   "return_arrangements"
    t.boolean  "installation_paid"
    t.boolean  "film_paid"
    t.string   "represent_first_name"
    t.string   "represent_last_name"
    t.string   "represent_gallery"
  end

  create_table "film_submissions", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "duration"
    t.string   "delivery_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
  end

  create_table "images", :force => true do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "visual_submission_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "installation_images", :force => true do |t|
    t.string   "installation_image_file_name"
    t.string   "installation_image_content_type"
    t.integer  "installation_image_file_size"
    t.datetime "installation_image_updated_at"
    t.integer  "installation_submission_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "installation_submissions", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "height"
    t.string   "h_unit"
    t.integer  "width"
    t.string   "w_unit"
    t.integer  "depth"
    t.string   "d_unit"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "artist_id"
  end

  create_table "literary_submissions", :force => true do |t|
    t.string   "title"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "doc_file_name"
    t.string   "doc_content_type"
    t.integer  "doc_file_size"
    t.datetime "doc_updated_at"
    t.integer  "artist_id"
  end

  create_table "payment_notifications", :force => true do |t|
    t.text     "params"
    t.integer  "user_id"
    t.string   "status"
    t.string   "transaction_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "product"
  end

  create_table "performance_submissions", :force => true do |t|
    t.string   "title"
    t.integer  "duration"
    t.text     "description"
    t.string   "type"
    t.text     "stage_requirements"
    t.text     "performance_experience"
    t.text     "bio"
    t.string   "url1"
    t.string   "url2"
    t.string   "url3"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "store_submissions", :force => true do |t|
    t.integer  "artist_id"
    t.string   "title"
    t.string   "description"
    t.string   "quantity"
    t.string   "quantity_accepted"
    t.boolean  "accepted"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "",       :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",       :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role",                                  :default => "artist"
    t.string   "juror"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "visual_submissions", :force => true do |t|
    t.string   "title"
    t.string   "medium"
    t.boolean  "dimension",          :default => false
    t.string   "height"
    t.string   "width"
    t.string   "depth"
    t.string   "h_unit"
    t.string   "w_unit"
    t.string   "d_unit"
    t.string   "year_created"
    t.integer  "sale_price"
    t.text     "notes"
    t.datetime "received_date"
    t.datetime "pickedup_date"
    t.string   "pickedup_by"
    t.datetime "shipped_date"
    t.string   "shipped_carrier"
    t.string   "shipped_tracking"
    t.boolean  "limited_edition"
    t.integer  "edition_position"
    t.integer  "edition_total"
    t.integer  "jury_one_vote"
    t.integer  "jury_two_vote"
    t.integer  "jury_three_vote"
    t.integer  "jury_four_vote"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "artist_id"
    t.integer  "jury_five_vote"
    t.integer  "average_vote"
    t.string   "acceptance_status",  :default => "undecided"
    t.boolean  "store_submit"
    t.string   "edition"
  end

end
