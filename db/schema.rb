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

ActiveRecord::Schema.define(version: 20170309030517) do

  create_table "fuels", force: :cascade do |t|
    t.string   "area"
    t.string   "state"
    t.string   "brand"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "ron_95_price_cents",    default: 0,     null: false
    t.string   "ron_95_price_currency", default: "MYR", null: false
    t.integer  "ron_97_price_cents",    default: 0,     null: false
    t.string   "ron_97_price_currency", default: "MYR", null: false
    t.integer  "diesel_price_cents",    default: 0,     null: false
    t.string   "diesel_price_currency", default: "MYR", null: false
  end

end
