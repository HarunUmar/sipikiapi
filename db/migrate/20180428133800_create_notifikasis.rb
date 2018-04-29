class CreateNotifikasis < ActiveRecord::Migration[5.1]
  def change
    create_table :notifikasis do |t|
      t.references :user, foreign_key: true
      t.string :isi
      t.integer :kode
      t.string :tujuan
      t.timestamps
    end
  end
end
