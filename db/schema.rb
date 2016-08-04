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

ActiveRecord::Schema.define(version: 20160804232411) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "competitors", force: :cascade do |t|
    t.string   "name"
    t.integer  "league_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["league_id"], name: "index_competitors_on_league_id", using: :btree
  end

  create_table "competitors_matches", force: :cascade do |t|
    t.integer "competitor_id"
    t.integer "match_id"
    t.index ["competitor_id"], name: "index_competitors_matches_on_competitor_id", using: :btree
    t.index ["match_id"], name: "index_competitors_matches_on_match_id", using: :btree
  end

  create_table "leagues", force: :cascade do |t|
    t.string   "name"
    t.integer  "number_of_rounds", default: 5
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "matches", force: :cascade do |t|
    t.integer  "round_number"
    t.integer  "winner_id"
    t.integer  "loser_id"
    t.integer  "league_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["league_id"], name: "index_matches_on_league_id", using: :btree
    t.index ["loser_id"], name: "index_matches_on_loser_id", using: :btree
    t.index ["winner_id"], name: "index_matches_on_winner_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
