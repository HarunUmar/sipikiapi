class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.string :isi
      t.column :blokir, :integer, default: 1
      t.string :warna_tulisan
      t.string :lat
      t.string :lng
      t.timestamps
    end
  end
end
