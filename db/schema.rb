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

ActiveRecord::Schema.define(version: 20140508133405) do

  create_table "appointments", force: true do |t|
    t.integer  "user_id"
    t.datetime "apt_date"
    t.datetime "apt_time"
    t.integer  "attending_physician"
    t.integer  "rescheduled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "calendars", force: true do |t|
    t.integer  "user_id"
    t.integer  "appointment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "charts", force: true do |t|
    t.integer  "user_id"
    t.string   "bp"
    t.string   "heart_rate"
    t.integer  "resp_rate"
    t.integer  "temp"
    t.string   "given_symptoms"
    t.string   "observed_symptoms"
    t.string   "comments"
    t.string   "diagnosis"
    t.string   "prognosis"
    t.string   "visit_purpose"
    t.string   "preconditions"
    t.integer  "height"
    t.integer  "weight"
    t.string   "verbal_instructions"
    t.string   "notes"
    t.integer  "lab_request"
    t.integer  "attachment_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "late_fee"
    t.integer  "checked_in"
  end

  create_table "messages", force: true do |t|
    t.integer  "user_id"
    t.integer  "recipient_id"
    t.string   "subject"
    t.string   "content"
    t.integer  "attachment",   default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["user_id", "created_at"], name: "index_messages_on_user_id_and_created_at"

  create_table "reports", force: true do |t|
    t.integer  "user_id"
    t.integer  "type"
    t.integer  "attachment"
    t.string   "purpose"
    t.string   "tests_performed"
    t.string   "tests_request"
    t.string   "included_specimen"
    t.string   "lab_notes"
    t.string   "request_notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "dob"
    t.string   "address"
    t.string   "phone"
    t.string   "insurance"
    t.integer  "insur_grp_id"
    t.string   "insur_policy_acc"
    t.integer  "role",                   default: 0
    t.string   "full_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
