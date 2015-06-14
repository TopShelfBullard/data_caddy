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

ActiveRecord::Schema.define(version: 20150614053052) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clubs", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "position"
  end

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "holes", force: :cascade do |t|
    t.integer  "number"
    t.integer  "par"
    t.integer  "distance"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "holes", ["course_id"], name: "index_holes_on_course_id", using: :btree

  create_table "played_holes", force: :cascade do |t|
    t.integer  "hole_id"
    t.integer  "round_id"
    t.integer  "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "played_holes", ["hole_id"], name: "index_played_holes_on_hole_id", using: :btree
  add_index "played_holes", ["player_id"], name: "index_played_holes_on_player_id", using: :btree
  add_index "played_holes", ["round_id"], name: "index_played_holes_on_round_id", using: :btree

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "players", ["email"], name: "index_players_on_email", unique: true, using: :btree
  add_index "players", ["reset_password_token"], name: "index_players_on_reset_password_token", unique: true, using: :btree

  create_table "rounds", force: :cascade do |t|
    t.date     "date"
    t.integer  "score"
    t.boolean  "finished"
    t.integer  "course_id"
    t.integer  "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "rounds", ["course_id"], name: "index_rounds_on_course_id", using: :btree
  add_index "rounds", ["player_id"], name: "index_rounds_on_player_id", using: :btree

  create_table "shots", force: :cascade do |t|
    t.integer  "number"
    t.boolean  "tee_up",          default: false
    t.boolean  "tee_down",        default: false
    t.boolean  "tee_middle",      default: false
    t.boolean  "off_the_turf",    default: false
    t.boolean  "elevated_tee",    default: false
    t.boolean  "punch",           default: false
    t.boolean  "trick",           default: false
    t.boolean  "full",            default: false
    t.boolean  "quarter",         default: false
    t.boolean  "half",            default: false
    t.boolean  "three_quarters",  default: false
    t.boolean  "hook",            default: false
    t.boolean  "draw",            default: false
    t.boolean  "pull",            default: false
    t.boolean  "pure",            default: false
    t.boolean  "push",            default: false
    t.boolean  "fade",            default: false
    t.boolean  "shot_slice",      default: false
    t.boolean  "left",            default: false
    t.boolean  "right",           default: false
    t.boolean  "center",          default: false
    t.boolean  "lob",             default: false
    t.boolean  "pop_up",          default: false
    t.boolean  "shank",           default: false
    t.boolean  "skull",           default: false
    t.boolean  "over_club",       default: false
    t.boolean  "under_club",      default: false
    t.boolean  "high",            default: false
    t.boolean  "low",             default: false
    t.boolean  "chunk",           default: false
    t.boolean  "top",             default: false
    t.boolean  "soft",            default: false
    t.boolean  "hard",            default: false
    t.boolean  "sweet_spot",      default: false
    t.boolean  "cup",             default: false
    t.boolean  "apron",           default: false
    t.boolean  "green",           default: false
    t.boolean  "rough",           default: false
    t.boolean  "beach",           default: false
    t.boolean  "drink",           default: false
    t.boolean  "out_of_bounds",   default: false
    t.boolean  "downslope",       default: false
    t.boolean  "upslope",         default: false
    t.boolean  "side_hill_right", default: false
    t.boolean  "side_hill_left",  default: false
    t.boolean  "obstructed",      default: false
    t.boolean  "fairway",         default: false
    t.boolean  "mulligan",        default: false
    t.boolean  "drop",            default: false
    t.boolean  "practice",        default: false
    t.integer  "played_hole_id"
    t.integer  "round_id"
    t.integer  "club_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "shots", ["club_id"], name: "index_shots_on_club_id", using: :btree
  add_index "shots", ["played_hole_id"], name: "index_shots_on_played_hole_id", using: :btree
  add_index "shots", ["round_id"], name: "index_shots_on_round_id", using: :btree

  add_foreign_key "shots", "played_holes"
end
