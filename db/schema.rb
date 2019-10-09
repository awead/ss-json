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

ActiveRecord::Schema.define(version: 2019_10_09_011845) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "access_controls", force: :cascade do |t|
    t.string "access_level"
    t.string "agent_type"
    t.bigint "agent_id"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_type", "agent_id"], name: "index_access_controls_on_agent_type_and_agent_id"
    t.index ["resource_type", "resource_id"], name: "index_access_controls_on_resource_type_and_resource_id"
  end

  create_table "aliases", force: :cascade do |t|
    t.string "display_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "creator_id"
    t.index ["creator_id"], name: "index_aliases_on_creator_id"
  end

  create_table "creators", force: :cascade do |t|
    t.string "surname"
    t.string "given_name"
    t.string "email"
    t.string "psu_id"
    t.string "orcid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "file_resources", force: :cascade do |t|
    t.jsonb "file_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "file_version_memberships", force: :cascade do |t|
    t.bigint "work_version_id"
    t.bigint "file_resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.index ["file_resource_id"], name: "index_file_version_memberships_on_file_resource_id"
    t.index ["work_version_id"], name: "index_file_version_memberships_on_work_version_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "access_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "work_creations", force: :cascade do |t|
    t.bigint "alias_id"
    t.bigint "work_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alias_id"], name: "index_work_creations_on_alias_id"
    t.index ["work_id"], name: "index_work_creations_on_work_id"
  end

  create_table "work_versions", force: :cascade do |t|
    t.bigint "work_id"
    t.string "version_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "aasm_state"
    t.jsonb "metadata"
    t.index ["work_id"], name: "index_work_versions_on_work_id"
  end

  create_table "works", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "depositor_id"
    t.string "work_type"
    t.index ["depositor_id"], name: "index_works_on_depositor_id"
  end

  add_foreign_key "aliases", "creators"
  add_foreign_key "file_version_memberships", "file_resources"
  add_foreign_key "file_version_memberships", "work_versions"
  add_foreign_key "work_creations", "aliases"
  add_foreign_key "work_creations", "works"
  add_foreign_key "work_versions", "works"
  add_foreign_key "works", "users", column: "depositor_id"
end
