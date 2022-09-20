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

  create_table "combinations", force: :cascade do |t|
    t.string "wanted_item", null: false
    t.string "owned_item", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owned_item"], name: "index_combinations_on_owned_item"
    t.index ["wanted_item", "owned_item"], name: "index_combinations_on_wanted_item_and_owned_item", unique: true
    t.index ["wanted_item"], name: "index_combinations_on_wanted_item"
  end

  create_table "combinations_registrations", force: :cascade do |t|
    t.integer "registrations_id", null: false
    t.integer "combinations_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["combinations_id"], name: "index_combinations_registrations_on_combinations_id"
    t.index ["registrations_id"], name: "index_combinations_registrations_on_registrations_id"
  end

  create_table "configs", force: :cascade do |t|
    t.boolean "notify_by_dm", default: true, null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_configs_on_user_id"
  end

  create_table "keywords", force: :cascade do |t|
    t.integer "serch_condition_id", null: false
    t.string "keyword", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["serch_condition_id"], name: "index_keywords_on_serch_condition_id"
  end

  create_table "matches", force: :cascade do |t|
    t.integer "registrations_id", null: false
    t.integer "tweets_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index "\"registration_id\", \"tweet_id\"", name: "index_matches_on_registration_id_and_tweet_id", unique: true
    t.index ["registrations_id"], name: "index_matches_on_registrations_id"
    t.index ["tweets_id"], name: "index_matches_on_tweets_id"
  end

  create_table "offers", force: :cascade do |t|
    t.integer "combinations_id", null: false
    t.integer "tweets_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index "\"combination_id\", \"tweet_id\"", name: "index_offers_on_combination_id_and_tweet_id", unique: true
    t.index ["combinations_id"], name: "index_offers_on_combinations_id"
    t.index ["tweets_id"], name: "index_offers_on_tweets_id"
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
    t.string "image_1"
    t.string "image_2"
    t.string "image_3"
    t.string "image_4"
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
    t.string "uid"
    t.string "provider"
    t.string "name"
    t.string "image"
    t.string "nickname"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "combinations_registrations", "combinations", column: "combinations_id"
  add_foreign_key "combinations_registrations", "registrations", column: "registrations_id"
  add_foreign_key "configs", "users"
  add_foreign_key "keywords", "serch_conditions"
  add_foreign_key "matches", "registrations", column: "registrations_id"
  add_foreign_key "matches", "tweets", column: "tweets_id"
  add_foreign_key "offers", "combinations", column: "combinations_id"
  add_foreign_key "offers", "tweets", column: "tweets_id"
  add_foreign_key "registrations", "users"
end
