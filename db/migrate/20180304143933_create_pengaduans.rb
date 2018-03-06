class CreatePengaduans < ActiveRecord::Migration[5.1]
  def change
    create_table :pengaduans do |t|
      t.references :user, foreign_key: true
      t.references :kategori, foreign_key: true
      t.string :isi
      t.string :lat
      t.string :lng
      t.column :status, :integer, default: 0
      t.timestamps
    end
  end
end
