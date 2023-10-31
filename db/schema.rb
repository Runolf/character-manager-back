# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_04_15_145758) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", id: :serial, force: :cascade do |t|
    t.string "player", limit: 300
    t.string "firstname", limit: 300
    t.string "lastname", limit: 300
    t.string "gender", limit: 50
    t.string "race", limit: 100
    t.string "job", limit: 100
    t.string "origin", limit: 100
    t.integer "age"
    t.string "background", limit: 500
    t.integer "game_id"
    t.index ["game_id"], name: "game_id"
  end

  create_table "games", id: :serial, force: :cascade do |t|
    t.string "title", limit: 300
    t.string "genre", limit: 300
    t.string "image", limit: 500
    t.string "owner", limit: 300
  end

  create_table "user_games", force: :cascade do |t|
    t.integer "user_id"
    t.integer "game_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "pseudo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password"
    t.boolean "isadmin"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "characters", "games", name: "characters_ibfk_1"
end
