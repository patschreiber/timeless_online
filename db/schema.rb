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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141028212802) do

  create_table "areas", force: true do |t|
    t.string "name"
  end

  create_table "enemies", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "classification"
    t.integer  "level"
    t.integer  "experience"
    t.integer  "ap"
    t.integer  "hp"
    t.integer  "mp"
    t.integer  "base_attack"
    t.integer  "base_defense"
    t.integer  "speed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "enemy_areas", force: true do |t|
    t.integer "enemy_id"
    t.integer "area_id"
  end

  create_table "enemy_loot_tables", force: true do |t|
    t.integer "rarity"
    t.integer "item_id"
  end

  create_table "enemy_skills", force: true do |t|
    t.integer "enemy_id"
    t.integer "skill_id"
  end

  create_table "items", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "classification"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "levels", force: true do |t|
    t.integer "level"
    t.integer "experience_required"
  end

  create_table "magics", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "classification"
    t.integer  "damage"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skills", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "classification"
    t.integer  "damage"
    t.integer  "ap"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_areas", force: true do |t|
    t.integer "user_id"
    t.integer "area_id"
  end

  create_table "user_inventories", force: true do |t|
    t.integer "item_id",  limit: 8
    t.integer "quantity"
  end

  create_table "user_magics", force: true do |t|
    t.integer "user_id"
    t.integer "magic_id"
  end

  create_table "user_skills", force: true do |t|
    t.integer "user_id"
    t.integer "skill_id"
  end

  create_table "user_stats", force: true do |t|
    t.integer  "user_id"
    t.integer  "level"
    t.integer  "current_experience"
    t.integer  "total_experience"
    t.integer  "current_gold"
    t.integer  "hp"
    t.integer  "mp"
    t.integer  "base_attack"
    t.integer  "base_defense"
    t.integer  "speed"
    t.string   "current_area"
    t.integer  "total_wins"
    t.integer  "total_losses"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "username"
    t.string   "last_name"
    t.string   "first_name"
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", using: :btree

end
