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

ActiveRecord::Schema.define(version: 20150501054732) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clubs", force: :cascade do |t|
    t.string   "name"
    t.string   "head"
    t.string   "shaft"
    t.string   "abbreviation"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
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
    t.boolean  "tee_up"
    t.boolean  "tee_down"
    t.boolean  "tee_middle"
    t.boolean  "off_the_turf"
    t.boolean  "elevated_tee"
    t.boolean  "punch"
    t.boolean  "trick"
    t.boolean  "full"
    t.boolean  "quarter"
    t.boolean  "half"
    t.boolean  "three_quarters"
    t.boolean  "hook"
    t.boolean  "draw"
    t.boolean  "pull"
    t.boolean  "pure"
    t.boolean  "push"
    t.boolean  "fade"
    t.boolean  "shot_slice"
    t.boolean  "left"
    t.boolean  "right"
    t.boolean  "center"
    t.boolean  "lob"
    t.boolean  "pop_up"
    t.boolean  "shank"
    t.boolean  "skull"
    t.boolean  "over_club"
    t.boolean  "under_club"
    t.boolean  "high"
    t.boolean  "low"
    t.boolean  "chunk"
    t.boolean  "top"
    t.boolean  "soft"
    t.boolean  "hard"
    t.boolean  "sweet_spot"
    t.boolean  "cup"
    t.boolean  "apron"
    t.boolean  "green"
    t.boolean  "rough"
    t.boolean  "beach"
    t.boolean  "drink"
    t.boolean  "out_of_bounds"
    t.boolean  "downslope"
    t.boolean  "upslope"
    t.boolean  "side_hill_right"
    t.boolean  "side_hill_left"
    t.boolean  "obstructed"
    t.boolean  "fairway"
    t.boolean  "mulligan"
    t.boolean  "drop"
    t.boolean  "practice"
    t.integer  "played_hole_id"
    t.integer  "round_id"
    t.integer  "club_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "shots", ["club_id"], name: "index_shots_on_club_id", using: :btree
  add_index "shots", ["played_hole_id"], name: "index_shots_on_played_hole_id", using: :btree
  add_index "shots", ["round_id"], name: "index_shots_on_round_id", using: :btree

  add_foreign_key "shots", "played_holes"
end
