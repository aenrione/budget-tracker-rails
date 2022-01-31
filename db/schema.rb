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

ActiveRecord::Schema.define(version: 2022_01_31_142729) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "buda_accounts", force: :cascade do |t|
    t.string "encrypted_password", default: "", null: false
    t.string "api_key", null: false
    t.string "account_name", default: "Buda", null: false
    t.decimal "balance", precision: 14, scale: 2, default: "0.0", null: false
    t.bigint "user_id", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "investments_return", precision: 14, scale: 2, default: "0.0"
    t.index ["reset_password_token"], name: "index_buda_accounts_on_reset_password_token", unique: true
    t.index ["user_id"], name: "index_buda_accounts_on_user_id"
  end

  create_table "buda_currencies", force: :cascade do |t|
    t.decimal "available"
    t.decimal "current"
    t.decimal "frozen_amount"
    t.decimal "pending"
    t.string "currency", null: false
    t.bigint "buda_account_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["buda_account_id"], name: "index_buda_currencies_on_buda_account_id"
  end

  create_table "fintoc_accounts", force: :cascade do |t|
    t.string "encrypted_password", default: "", null: false
    t.string "link", null: false
    t.string "account_name", default: "Fintoc", null: false
    t.decimal "balance", precision: 14, scale: 2, default: "0.0", null: false
    t.bigint "user_id", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "income", precision: 14, scale: 2, default: "0.0"
    t.decimal "expense", precision: 14, scale: 2, default: "0.0"
    t.index ["reset_password_token"], name: "index_fintoc_accounts_on_reset_password_token", unique: true
    t.index ["user_id"], name: "index_fintoc_accounts_on_user_id"
  end

  create_table "fintoc_bank_accounts", force: :cascade do |t|
    t.string "account_id"
    t.string "name"
    t.string "official_name"
    t.string "holder_id", null: false
    t.string "holder_name", null: false
    t.string "type"
    t.string "currency", null: false
    t.string "number", null: false
    t.decimal "balance", precision: 14, scale: 2
    t.bigint "fintoc_account_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "income", precision: 14, scale: 2, default: "0.0"
    t.decimal "expense", precision: 14, scale: 2, default: "0.0"
    t.index ["fintoc_account_id"], name: "index_fintoc_bank_accounts_on_fintoc_account_id"
  end

  create_table "fintual_accounts", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "account_name", default: "Fintual", null: false
    t.decimal "balance", precision: 14, scale: 2, default: "0.0", null: false
    t.bigint "user_id", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "investments_return", precision: 14, scale: 2, default: "0.0"
    t.index ["reset_password_token"], name: "index_fintual_accounts_on_reset_password_token", unique: true
    t.index ["user_id"], name: "index_fintual_accounts_on_user_id"
  end

  create_table "fintual_goals", force: :cascade do |t|
    t.string "name"
    t.date "creation_date"
    t.decimal "deposited", precision: 14, scale: 2
    t.decimal "current", precision: 14, scale: 2
    t.decimal "profit", precision: 14, scale: 2
    t.string "currency", default: "CLP", null: false
    t.bigint "fintual_account_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["fintual_account_id"], name: "index_fintual_goals_on_fintual_account_id"
  end

  create_table "transaction_categories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.decimal "amount", precision: 14, scale: 2
    t.text "comment"
    t.string "currency"
    t.string "description"
    t.string "transaction_id"
    t.date "post_date"
    t.date "transaction_date"
    t.string "transaction_type"
    t.string "holder_id"
    t.string "holder_name"
    t.string "holder_institution"
    t.bigint "fintoc_bank_account_id"
    t.bigint "transaction_category_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["fintoc_bank_account_id"], name: "index_transactions_on_fintoc_bank_account_id"
    t.index ["transaction_category_id"], name: "index_transactions_on_transaction_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", null: false
    t.decimal "balance", precision: 14, scale: 2, default: "0.0"
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.text "tokens"
    t.decimal "income", precision: 14, scale: 2, default: "0.0"
    t.decimal "expense", precision: 14, scale: 2, default: "0.0"
    t.decimal "investments_return", precision: 14, scale: 2, default: "0.0"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.bigint "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "buda_accounts", "users"
  add_foreign_key "buda_currencies", "buda_accounts"
  add_foreign_key "fintoc_accounts", "users"
  add_foreign_key "fintoc_bank_accounts", "fintoc_accounts"
  add_foreign_key "fintual_accounts", "users"
  add_foreign_key "fintual_goals", "fintual_accounts"
  add_foreign_key "transactions", "fintoc_bank_accounts"
  add_foreign_key "transactions", "transaction_categories"
end
