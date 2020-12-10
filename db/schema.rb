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

ActiveRecord::Schema.define(version: 2020_12_10_155824) do

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

  create_table "admin_users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.string "phone"
    t.string "email"
    t.string "role_options", comment: "角色cids", array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "brands", force: :cascade do |t|
    t.string "name", comment: "中文名称"
    t.string "english_name", comment: "英文名称"
    t.integer "status", default: 0, comment: "状态 0 可见 1 不可见"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cars", force: :cascade do |t|
    t.bigint "brand_id", null: false
    t.bigint "node_id", null: false
    t.bigint "sub_node_id", null: false
    t.float "msrp", comment: "建议零售价格"
    t.string "particular_year", comment: "年份"
    t.float "sell_price", comment: "出售价格"
    t.float "freight", comment: "运费"
    t.float "open_fee", comment: "开证服务费"
    t.float "oversea_fee", comment: "海外仓服务费"
    t.string "cid", comment: "车源编码"
    t.string "code_options", comment: "配置项", array: true
    t.integer "status", default: 0, comment: "状态 0 下线 1 上线 2 已售出 3 已锁定"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["brand_id"], name: "index_cars_on_brand_id"
    t.index ["cid"], name: "index_cars_on_cid"
    t.index ["code_options"], name: "index_cars_on_code_options", using: :gin
    t.index ["node_id"], name: "index_cars_on_node_id"
    t.index ["sub_node_id"], name: "index_cars_on_sub_node_id"
  end

  create_table "codes", force: :cascade do |t|
    t.string "cid", comment: "唯一码"
    t.string "name", comment: "名字"
    t.float "price", default: 0.0
    t.integer "status", default: 0, comment: "状态 0 可见 1 不可见"
    t.bigint "sub_node_id", null: false
    t.bigint "node_id", null: false
    t.bigint "brand_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "style", comment: "配置类型"
    t.index ["brand_id"], name: "index_codes_on_brand_id"
    t.index ["cid"], name: "index_codes_on_cid"
    t.index ["node_id"], name: "index_codes_on_node_id"
    t.index ["style"], name: "index_codes_on_style"
    t.index ["sub_node_id"], name: "index_codes_on_sub_node_id"
  end

  create_table "nodes", force: :cascade do |t|
    t.string "name", comment: "中文名"
    t.string "english_name", comment: "英文名"
    t.integer "status", default: 0, comment: "是否可见 0 可见 1 不可见"
    t.bigint "brand_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["brand_id"], name: "index_nodes_on_brand_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "status", default: 0, comment: "订单状态 0 待跟进 1 已成交 2 成交失败"
    t.bigint "car_id", null: false
    t.bigint "brand_id", null: false
    t.bigint "node_id", null: false
    t.bigint "sub_node_id", null: false
    t.string "order_no", comment: "订单编号"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["brand_id"], name: "index_orders_on_brand_id"
    t.index ["car_id"], name: "index_orders_on_car_id"
    t.index ["node_id"], name: "index_orders_on_node_id"
    t.index ["sub_node_id"], name: "index_orders_on_sub_node_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name", comment: "角色名"
    t.string "cid", comment: "角色编码"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rules", force: :cascade do |t|
    t.string "mod_name", comment: "功能名"
    t.string "act_name", comment: "方法名"
    t.string "control", comment: "控制器"
    t.string "act", comment: "方法"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sub_nodes", force: :cascade do |t|
    t.string "name", comment: "中文名"
    t.string "english_name", comment: "英文名"
    t.integer "status", default: 0, comment: "是否可见 0 可见 1 不可见"
    t.bigint "node_id", null: false
    t.bigint "brand_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["brand_id"], name: "index_sub_nodes_on_brand_id"
    t.index ["node_id"], name: "index_sub_nodes_on_node_id"
  end

  create_table "uploads", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username", comment: "真实姓名"
    t.string "openid", comment: "微信openid"
    t.string "phone", comment: "手机号"
    t.string "email", comment: "邮箱"
    t.string "session_key", comment: "会话密钥"
    t.string "company_name", comment: "公司名称"
    t.string "company_addr", comment: "公司地址"
    t.string "company_qual", comment: "公司资质"
    t.integer "status", default: 0, comment: "状态"
    t.string "avatar", comment: "头像"
    t.string "nickname", comment: "昵称"
    t.string "area", comment: "地区"
    t.datetime "last_time", comment: "最后一次登陆时间"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "cars", "brands"
  add_foreign_key "cars", "nodes"
  add_foreign_key "cars", "sub_nodes"
  add_foreign_key "codes", "brands"
  add_foreign_key "codes", "nodes"
  add_foreign_key "codes", "sub_nodes"
  add_foreign_key "nodes", "brands"
  add_foreign_key "orders", "brands"
  add_foreign_key "orders", "cars"
  add_foreign_key "orders", "nodes"
  add_foreign_key "orders", "sub_nodes"
  add_foreign_key "orders", "users"
  add_foreign_key "sub_nodes", "brands"
  add_foreign_key "sub_nodes", "nodes"
end
