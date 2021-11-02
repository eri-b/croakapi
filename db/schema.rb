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

ActiveRecord::Schema.define(version: 2021_11_02_220004) do

  create_table "dm_members", force: :cascade do |t|
    t.integer "dm_member1_id"
    t.integer "dm_member2_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "group_id", null: false
    t.index ["dm_member1_id", "dm_member2_id"], name: "index_dm_members_on_dm_member1_id_and_dm_member2_id", unique: true
    t.index ["dm_member1_id"], name: "index_dm_members_on_dm_member1_id"
    t.index ["dm_member2_id"], name: "index_dm_members_on_dm_member2_id"
    t.index ["group_id"], name: "index_dm_members_on_group_id"
  end

  create_table "group_members", force: :cascade do |t|
    t.integer "group_id", null: false
    t.integer "user_id", null: false
    t.boolean "admin", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "muted", default: false
    t.index ["group_id", "user_id"], name: "index_group_members_on_group_id_and_user_id", unique: true
    t.index ["group_id"], name: "index_group_members_on_group_id"
    t.index ["user_id"], name: "index_group_members_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "dm"
    t.string "dm_lookup"
    t.integer "creator_id"
    t.index ["creator_id"], name: "index_groups_on_creator_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "body"
    t.integer "group_member_id", null: false
    t.integer "group_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_messages_on_group_id"
    t.index ["group_member_id"], name: "index_messages_on_group_member_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "phone_number"
    t.string "username"
    t.boolean "verified", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["phone_number"], name: "index_users_on_phone_number", unique: true
  end

  add_foreign_key "dm_members", "groups"
  add_foreign_key "group_members", "groups"
  add_foreign_key "group_members", "users"
  add_foreign_key "messages", "group_members"
  add_foreign_key "messages", "groups"
end
