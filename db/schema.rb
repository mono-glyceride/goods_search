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

ActiveRecord::Schema.define(version: 2022_09_17_095109) do

  create_table "collections", force: :cascade do |t|
    t.integer "tweet_id", null: false
    t.integer "wanted_item_id"
    t.integer "owned_item_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index "\"tweet\", \"wanted_item\", \"owned_item\"", name: "index_collections_on_tweet_and_wanted_item_and_owned_item", unique: true
    t.index ["owned_item_id"], name: "index_collections_on_owned_item_id"
    t.index ["tweet_id"], name: "index_collections_on_tweet_id"
    t.index ["wanted_item_id"], name: "index_collections_on_wanted_item_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_items_on_name"
  end

  create_table "serch_conditions", force: :cascade do |t|
    t.string "keywords"
    t.integer "user_id", null: false
    t.integer "wanted_item_id"
    t.integer "owned_item_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owned_item_id"], name: "index_serch_conditions_on_owned_item_id"
    t.index ["user_id"], name: "index_serch_conditions_on_user_id"
    t.index ["wanted_item_id"], name: "index_serch_conditions_on_wanted_item_id"
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

  add_foreign_key "collections", "items", column: "owned_item_id"
  add_foreign_key "collections", "items", column: "wanted_item_id"
  add_foreign_key "collections", "tweets"
  add_foreign_key "serch_conditions", "items", column: "owned_item_id"
  add_foreign_key "serch_conditions", "items", column: "wanted_item_id"
  add_foreign_key "serch_conditions", "users"
end
