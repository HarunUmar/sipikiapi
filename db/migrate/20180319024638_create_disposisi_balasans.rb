class CreateDisposisiBalasans < ActiveRecord::Migration[5.1]
  def change
    create_table :disposisi_balasans do |t|
      t.references :user, foreign_key: true
      t.references :disposisi, foreign_key: true
      t.text :isi
      t.text :ket

      t.timestamps
    end
  end
end
