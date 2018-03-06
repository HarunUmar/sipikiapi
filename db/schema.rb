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

ActiveRecord::Schema.define(version: 20180304150834) do

  create_table "commentpengaduans", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "pengaduan_id"
    t.bigint "user_id"
    t.string "isi"
    t.integer "sub"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pengaduan_id"], name: "index_commentpengaduans_on_pengaduan_id"
    t.index ["user_id"], name: "index_commentpengaduans_on_user_id"
  end

  create_table "commentposts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "post_id"
    t.string "isi"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_commentposts_on_post_id"
    t.index ["user_id"], name: "index_commentposts_on_user_id"
  end

  create_table "emeis", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.string "emei"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_emeis_on_user_id"
  end

  create_table "gambarpengaduans", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "pengaduan_id"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pengaduan_id"], name: "index_gambarpengaduans_on_pengaduan_id"
  end

  create_table "gambarposts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "post_id"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_gambarposts_on_post_id"
  end

  create_table "kategoris", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "kategori"
    t.string "url_icon"
    t.integer "status", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likepengaduans", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "pengaduan_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pengaduan_id"], name: "index_likepengaduans_on_pengaduan_id"
    t.index ["user_id"], name: "index_likepengaduans_on_user_id"
  end

  create_table "loveposts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_loveposts_on_post_id"
    t.index ["user_id"], name: "index_loveposts_on_user_id"
  end

  create_table "pengaduans", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "kategori_id"
    t.string "isi"
    t.string "lat"
    t.string "lng"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kategori_id"], name: "index_pengaduans_on_kategori_id"
    t.index ["user_id"], name: "index_pengaduans_on_user_id"
  end

  create_table "posts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.string "isi"
    t.integer "blokir", default: 1
    t.string "warna_tulisan"
    t.string "lat"
    t.string "lng"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "skpds", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "skpd"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tindaklanjuts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "pengaduan_id"
    t.bigint "userskpd_id"
    t.integer "status", default: 1
    t.integer "dikerjakan", default: 0
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pengaduan_id"], name: "index_tindaklanjuts_on_pengaduan_id"
    t.index ["userskpd_id"], name: "index_tindaklanjuts_on_userskpd_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "no_ktp"
    t.string "nama"
    t.string "hp"
    t.string "url_foto"
    t.string "username"
    t.string "id_fb"
    t.string "token_fb"
    t.integer "skpd", default: 1
    t.integer "status", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "userskpds", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "skpd_id"
    t.string "jabatan", default: "staf"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["skpd_id"], name: "index_userskpds_on_skpd_id"
    t.index ["user_id"], name: "index_userskpds_on_user_id"
  end

  add_foreign_key "commentpengaduans", "pengaduans"
  add_foreign_key "commentpengaduans", "users"
  add_foreign_key "commentposts", "posts"
  add_foreign_key "commentposts", "users"
  add_foreign_key "emeis", "users"
  add_foreign_key "gambarpengaduans", "pengaduans"
  add_foreign_key "gambarposts", "posts"
  add_foreign_key "likepengaduans", "pengaduans"
  add_foreign_key "likepengaduans", "users"
  add_foreign_key "loveposts", "posts"
  add_foreign_key "loveposts", "users"
  add_foreign_key "pengaduans", "kategoris"
  add_foreign_key "pengaduans", "users"
  add_foreign_key "posts", "users"
  add_foreign_key "tindaklanjuts", "pengaduans"
  add_foreign_key "tindaklanjuts", "userskpds"
  add_foreign_key "userskpds", "skpds"
  add_foreign_key "userskpds", "users"
end
