class CreateGambarDisposisiBalasans < ActiveRecord::Migration[5.1]
  def change
    create_table :gambar_disposisi_balasans do |t|
      t.references :disposisi_balasan, foreign_key: true
      t.string :url
      t.timestamps
    end
  end
end
