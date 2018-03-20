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

ActiveRecord::Schema.define(version: 20180320030321) do

  create_table "accounts", force: :cascade do |t|
    t.string "balance"
    t.string "expirationDate"
    t.string "accountStatus"
    t.string "expiredAccount"
    t.string "simcardNumber"
    t.string "phoneNumber"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "customerName"
    t.string "nickname"
  end

  create_table "h2o_customers", force: :cascade do |t|
    t.string "companyName"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "h2o_re_ups", force: :cascade do |t|
    t.string "companyName"
    t.string "simCard"
    t.string "phoneNumber"
    t.date "reupDate"
    t.date "expirationDate"
    t.text "pinNumber"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string "custumer_name"
    t.integer "ponumber"
    t.string "payable"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "customerNotes"
    t.string "email"
    t.string "terms"
    t.date "expectedDate"
    t.date "receivedDate"
    t.integer "user_id"
    t.date "payment_sent"
    t.decimal "amount"
    t.date "due_date"
    t.string "incoming_tracking"
    t.string "outgoing_tracking"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
