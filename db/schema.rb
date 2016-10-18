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

ActiveRecord::Schema.define(version: 0) do

  create_table "categories", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",         limit: 20, null: false
    t.bigint   "userId",                  null: false
    t.datetime "creationDate",            null: false
    t.index ["name"], name: "name", unique: true, using: :btree
    t.index ["userId"], name: "userId", using: :btree
  end

  create_table "informations", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint   "userId",                                   null: false
    t.bigint   "categoryId",                               null: false
    t.string   "content",      limit: 512,                 null: false
    t.datetime "creationDate",                             null: false
    t.boolean  "public",                   default: false, null: false
    t.index ["categoryId"], name: "categoryId", using: :btree
    t.index ["userId"], name: "userId", using: :btree
  end

  create_table "requests", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint   "userId",                  null: false
    t.string   "name",         limit: 20, null: false
    t.datetime "creationDate",            null: false
    t.index ["name"], name: "name", unique: true, using: :btree
    t.index ["userId"], name: "userId", using: :btree
  end

  create_table "users", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "password",         limit: 32,                 null: false
    t.string  "email",            limit: 64,                 null: false
    t.date    "registrationDate",                            null: false
    t.boolean "confirmed",                   default: false, null: false
    t.index ["email"], name: "email", unique: true, using: :btree
  end

end
