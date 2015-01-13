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

ActiveRecord::Schema.define(version: 20150113044307) do

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
    t.integer "enemy_id"
    t.integer "rarity"
    t.integer "item_id"
  end

  create_table "enemy_skills", force: true do |t|
    t.integer "enemy_id"
    t.integer "skill_id"
  end

  create_table "equip_slots", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "generated_items", force: true do |t|
    t.integer  "item_id"
    t.string   "unique_item_id"
    t.string   "prefix_name"
    t.string   "name"
    t.string   "suffix_name"
    t.string   "description"
    t.integer  "classification"
    t.boolean  "can_equip"
    t.integer  "equip_slot"
    t.integer  "hp"
    t.integer  "mp"
    t.integer  "attack"
    t.integer  "defense"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "generated_items", ["item_id"], name: "index_generated_items_on_item_id", using: :btree
  add_index "generated_items", ["unique_item_id"], name: "index_generated_items_on_unique_item_id", unique: true, using: :btree

  create_table "item_prefixes", force: true do |t|
    t.string  "name"
    t.integer "min_hp_modifier"
    t.integer "max_hp_modifier"
    t.integer "min_mp_modifier"
    t.integer "max_mp_modifier"
    t.integer "min_attack_modifier"
    t.integer "max_attack_modifier"
    t.integer "min_defense_modifier"
    t.integer "max_defense_modifier"
    t.float   "min_speed_modifier"
    t.float   "max_speed_modifier"
    t.integer "min_value_modifier"
    t.integer "max_value_modifier"
  end

  create_table "item_suffixes", force: true do |t|
    t.string  "name"
    t.integer "min_hp_modifier"
    t.integer "max_hp_modifier"
    t.integer "min_mp_modifier"
    t.integer "max_mp_modifier"
    t.integer "min_attack_modifier"
    t.integer "max_attack_modifier"
    t.integer "min_defense_modifier"
    t.integer "max_defense_modifier"
    t.float   "min_speed_modifier"
    t.float   "max_speed_modifier"
    t.integer "min_value_modifier"
    t.integer "max_value_modifier"
  end

  create_table "items", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "classification"
    t.boolean  "can_add_uniqueness"
    t.boolean  "can_equip"
    t.integer  "equip_slot"
    t.integer  "min_hp"
    t.integer  "max_hp"
    t.integer  "min_mp"
    t.integer  "max_mp"
    t.integer  "min_attack"
    t.integer  "max_attack"
    t.integer  "min_defense"
    t.integer  "max_defense"
    t.integer  "value"
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

  create_table "user_equipped_items", force: true do |t|
    t.integer "user_id"
    t.integer "equip_slot"
    t.string  "unique_item_id"
  end

  create_table "user_inventories", force: true do |t|
    t.integer "user_id"
    t.integer "item_id"
    t.string  "unique_item_id"
    t.integer "quantity"
    t.boolean "equipped"
    t.integer "position"
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
