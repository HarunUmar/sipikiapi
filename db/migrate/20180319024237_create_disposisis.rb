class CreateDisposisis < ActiveRecord::Migration[5.1]
  def change
    create_table :disposisis do |t|
      t.references :user, foreign_key: true
      t.references :kinerja, foreign_key: true
      t.string :judul
      t.string :isi
      t.text :ket
      t.datetime :deadline

      t.timestamps
    end
  end
end
