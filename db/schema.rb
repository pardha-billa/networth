# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_03_18_095050) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "funds", force: :cascade do |t|
    t.string "fund_name"
    t.string "amc_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "fund_code"
    t.string "goal_name"
    t.string "fund_type"
    t.integer "folio_number"
    t.bigint "member_id", null: false
    t.date "nav_at"
    t.float "nav"
    t.index ["member_id"], name: "index_funds_on_member_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "fund_id", null: false
    t.date "transaction_date"
    t.string "transaction_type"
    t.float "amount"
    t.float "nav"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fund_id"], name: "index_transactions_on_fund_id"
  end

  add_foreign_key "funds", "members"
  add_foreign_key "transactions", "funds"

  create_view "retirement_portfolios", sql_definition: <<-SQL
      SELECT funds.fund_name,
      funds.nav,
      funds.nav_at,
      sum(transactions.amount) AS amount,
      sum((transactions.amount / transactions.nav)) AS units
     FROM (funds
       JOIN transactions ON ((funds.id = transactions.fund_id)))
    GROUP BY funds.fund_name, funds.nav, funds.nav_at;
  SQL
end
