# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_09_20_142741) do

  create_table "configs", force: :cascade do |t|
    t.boolean "notify_by_dm", default: true, null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_configs_on_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "wanted_item", null: false
    t.string "owned_item", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owned_item"], name: "index_items_on_owned_item"
    t.index ["wanted_item", "owned_item"], name: "index_items_on_wanted_item_and_owned_item", unique: true
    t.index ["wanted_item"], name: "index_items_on_wanted_item"
  end

  create_table "items_registrations", force: :cascade do |t|
    t.integer "registration_id", null: false
    t.integer "item_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_items_registrations_on_item_id"
    t.index ["registration_id"], name: "index_items_registrations_on_registration_id"
  end

  create_table "keywords", force: :cascade do |t|
    t.integer "registration_id", null: false
    t.string "keyword", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["registration_id"], name: "index_keywords_on_registration_id"
  end

  create_table "matches", force: :cascade do |t|
    t.integer "registration_id", null: false
    t.integer "tweet_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["registration_id", "tweet_id"], name: "index_matches_on_registration_id_and_tweet_id", unique: true
    t.index ["registration_id"], name: "index_matches_on_registration_id"
    t.index ["tweet_id"], name: "index_matches_on_tweet_id"
  end

  create_table "offers", force: :cascade do |t|
    t.integer "item_id", null: false
    t.integer "tweet_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id", "tweet_id"], name: "index_offers_on_item_id_and_tweet_id", unique: true
    t.index ["item_id"], name: "index_offers_on_item_id"
    t.index ["tweet_id"], name: "index_offers_on_tweet_id"
  end

  create_table "registrations", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_registrations_on_user_id"
  end

  create_table "tweets", force: :cascade do |t|
    t.string "param", null: false
    t.string "tweet_user_name", null: false
    t.string "tweet_user_icon", null: false
    t.string "image1_url"
    t.string "image2_url"
    t.string "image3_url"
    t.string "image4_url"
    t.string "body", null: false
    t.boolean "send", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "uid", null: false
    t.string "provider", null: false
    t.string "name", null: false
    t.string "image", null: false
    t.string "nickname", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid"], name: "index_users_on_uid", unique: true
  end

  add_foreign_key "configs", "users"
  add_foreign_key "items_registrations", "items"
  add_foreign_key "items_registrations", "registrations"
  add_foreign_key "keywords", "registrations"
  add_foreign_key "matches", "registrations"
  add_foreign_key "matches", "tweets"
  add_foreign_key "offers", "items"
  add_foreign_key "offers", "tweets"
  add_foreign_key "registrations", "users"
end
