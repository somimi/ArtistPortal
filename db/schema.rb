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

ActiveRecord::Schema.define(:version => 20120602060014) do

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
    t.string   "represent_gallery"
    t.string   "representname"
    t.boolean  "store_paid"
    t.boolean  "test"
    t.integer  "acceptance_status",         :default => 0
    t.text     "admin_notes"
    t.boolean  "shipping_label"
    t.boolean  "store_shipped_with_visual"
    t.boolean  "paperwork_complete"
    t.text     "paperwork_notes"
  end

  create_table "dj_submissions", :force => true do |t|
    t.string   "musical_style"
    t.text     "other_music"
    t.text     "live_links"
    t.text     "career"
    t.boolean  "six_16_day"
    t.boolean  "six_17_day"
    t.boolean  "six_22_day"
    t.boolean  "six_23_day"
    t.boolean  "six_24_day"
    t.boolean  "six_16_evening"
    t.boolean  "six_17_evening"
    t.boolean  "six_22_evening"
    t.boolean  "six_23_evening"
    t.boolean  "six_24_evening"
    t.boolean  "six_16_night"
    t.boolean  "six_22_night"
    t.boolean  "six_23_night"
    t.text     "want_to_play"
    t.text     "gear_requirements"
    t.text     "festival_history"
    t.text     "additional_notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "artist_id"
  end

  create_table "film_submissions", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "duration"
    t.string   "delivery_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
    t.integer  "artist_id"
    t.string   "acceptance_status"
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
    t.boolean  "want_funding"
    t.boolean  "for_sale"
    t.integer  "price"
    t.string   "acceptance_status"
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
    t.string   "lit_type"
    t.string   "acceptance_status"
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
    t.boolean  "mainstage_performance"
    t.boolean  "ambient_performance"
    t.integer  "artist_id"
    t.string   "acceptance_status"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

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
    t.string   "type"
    t.string   "type_other"
    t.integer  "height"
    t.integer  "width"
    t.integer  "depth"
    t.string   "h_unit"
    t.string   "w_unit"
    t.string   "d_unit"
    t.integer  "price"
    t.string   "presentation"
    t.string   "presentation_other"
    t.boolean  "provide_display"
    t.text     "notes"
    t.boolean  "dimension"
    t.integer  "visual_submission_id"
    t.text     "admin_notes"
    t.integer  "quantity_received"
    t.string   "quality"
    t.text     "quality_notes"
    t.boolean  "display_included"
    t.text     "display_notes"
    t.boolean  "packing_material"
    t.text     "packing_material_notes"
    t.boolean  "received"
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
    t.boolean  "dimension",                 :default => false
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
    t.float    "average_vote",              :default => 0.0
    t.string   "acceptance_status",         :default => "undecided"
    t.boolean  "store_submit"
    t.string   "edition"
    t.boolean  "donate_proceeds"
    t.boolean  "art_received"
    t.boolean  "display_included"
    t.boolean  "received"
    t.text     "display_notes"
    t.string   "quality"
    t.text     "quality_notes"
    t.boolean  "packing_material"
    t.text     "packing_material_notes"
    t.boolean  "packing_material_included"
    t.string   "wall_card_description"
  end

end
