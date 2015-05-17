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

ActiveRecord::Schema.define(version: 20150517034432) do

  create_table "clubs", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "course_players", force: :cascade do |t|
    t.integer  "player_id"
    t.integer  "course_id"
    t.integer  "highest_score"
    t.integer  "lowest_score"
    t.integer  "average_score"
    t.integer  "best_hole_id"
    t.integer  "worst_hole_id"
    t.integer  "dream_round"
    t.integer  "nightmare_round"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "course_player_id"
  end

  create_table "holes", force: :cascade do |t|
    t.integer  "number"
    t.integer  "par"
    t.integer  "distance"
    t.integer  "course_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "eagle_percentage"
    t.integer  "birdy_percentage"
    t.integer  "par_percentage"
    t.float    "bogie_percentage"
    t.integer  "failure_percentage"
  end

  create_table "lies", force: :cascade do |t|
    t.boolean  "in_cup"
    t.boolean  "on_apron"
    t.boolean  "on_green"
    t.boolean  "in_rough"
    t.boolean  "on_beach"
    t.boolean  "in_drink"
    t.boolean  "out_of_bounds"
    t.boolean  "on_downslope"
    t.boolean  "on_upslope"
    t.boolean  "on_side_hill_right"
    t.boolean  "on_side_hill_left"
    t.boolean  "obstructed_by_trees"
    t.boolean  "on_fairway"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.boolean  "tee_up"
    t.boolean  "tee_down"
    t.boolean  "tee_middle"
    t.boolean  "elevated_tee"
    t.integer  "shot_id"
    t.boolean  "off_the_turf"
  end

  create_table "played_holes", force: :cascade do |t|
    t.integer  "hole_id"
    t.integer  "round_id"
    t.integer  "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "player_holes", force: :cascade do |t|
    t.integer  "player_id"
    t.integer  "hole_id"
    t.integer  "best_score"
    t.integer  "worst_score"
    t.integer  "most_puts"
    t.integer  "least_putts"
    t.integer  "average_putts"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "player_opponents", force: :cascade do |t|
    t.integer  "player_id"
    t.integer  "opponent_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

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

  add_index "players", ["email"], name: "index_players_on_email", unique: true
  add_index "players", ["reset_password_token"], name: "index_players_on_reset_password_token", unique: true

  create_table "results", force: :cascade do |t|
    t.boolean  "was_hook"
    t.boolean  "was_draw"
    t.boolean  "was_pull"
    t.boolean  "was_pure"
    t.boolean  "was_push"
    t.boolean  "was_fade"
    t.boolean  "was_slice"
    t.boolean  "was_worm_burner"
    t.boolean  "was_goldie_bounce"
    t.boolean  "was_lob"
    t.boolean  "was_stoney"
    t.boolean  "was_pop_up"
    t.boolean  "was_shank"
    t.boolean  "was_skull"
    t.boolean  "was_tree_shot"
    t.boolean  "over_club"
    t.boolean  "under_club"
    t.boolean  "high_trajectory"
    t.boolean  "low_trajectory"
    t.boolean  "chunked"
    t.boolean  "topped"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "shot_id"
  end

  create_table "rounds", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "player_id"
    t.date     "date"
    t.integer  "score"
    t.boolean  "finished"
    t.integer  "opponent_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "shot_actions", force: :cascade do |t|
    t.boolean  "take_mulligan"
    t.boolean  "take_drop"
    t.boolean  "take_gimme"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "shots", force: :cascade do |t|
    t.integer  "round_id"
    t.integer  "club_id"
    t.integer  "number"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "played_hole_id"
    t.integer  "lie_id"
    t.integer  "result_id"
  end

end
