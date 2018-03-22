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

ActiveRecord::Schema.define(version: 20180319024638) do

  create_table "cities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "provinsi_id"
    t.string "city"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provinsi_id"], name: "index_cities_on_provinsi_id"
  end

  create_table "disposisi_balasans", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "disposisi_id"
    t.text "isi"
    t.text "ket"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["disposisi_id"], name: "index_disposisi_balasans_on_disposisi_id"
    t.index ["user_id"], name: "index_disposisi_balasans_on_user_id"
  end

  create_table "disposisis", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "kinerja_id"
    t.string "judul"
    t.string "isi"
    t.text "ket"
    t.datetime "deadline"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kinerja_id"], name: "index_disposisis_on_kinerja_id"
    t.index ["user_id"], name: "index_disposisis_on_user_id"
  end

  create_table "eselons", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "eselon"
    t.text "ket"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "instansis", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "instansi"
    t.integer "status", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jabatans", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "jabatan"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "kinerjas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "skp_id"
    t.string "kinerja"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["skp_id"], name: "index_kinerjas_on_skp_id"
  end

  create_table "provinsis", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "provinsi"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skps", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "skp"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spds", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "spd"
    t.bigint "instansi_id"
    t.text "alamat"
    t.string "no_tlp"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["instansi_id"], name: "index_spds_on_instansi_id"
  end

  create_table "user_disposisis", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "disposisi_id"
    t.integer "status"
    t.string "nilai"
    t.datetime "waktu"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["disposisi_id"], name: "index_user_disposisis_on_disposisi_id"
    t.index ["user_id"], name: "index_user_disposisis_on_user_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "spd_id"
    t.bigint "jabatan_id"
    t.bigint "eselon_id"
    t.bigint "city_id"
    t.string "fb"
    t.string "token"
    t.string "nama"
    t.string "hp"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_users_on_city_id"
    t.index ["eselon_id"], name: "index_users_on_eselon_id"
    t.index ["jabatan_id"], name: "index_users_on_jabatan_id"
    t.index ["spd_id"], name: "index_users_on_spd_id"
  end

  add_foreign_key "cities", "provinsis"
  add_foreign_key "disposisi_balasans", "disposisis"
  add_foreign_key "disposisi_balasans", "users"
  add_foreign_key "disposisis", "kinerjas"
  add_foreign_key "disposisis", "users"
  add_foreign_key "kinerjas", "skps"
  add_foreign_key "spds", "instansis"
  add_foreign_key "user_disposisis", "disposisis"
  add_foreign_key "user_disposisis", "users"
  add_foreign_key "users", "cities"
  add_foreign_key "users", "eselons"
  add_foreign_key "users", "jabatans"
  add_foreign_key "users", "spds"
end
