class CreateAgendas < ActiveRecord::Migration[5.1]
  def change
    create_table :agendas do |t|
      t.references :kinerja, foreign_key: true
      t.references :user, foreign_key: true
      t.string :judul
      t.text :ket
      t.string :lat
      t.string :lang
      t.text :lokasi
      t.datetime :waktu
      t.column :status, :integer, default: 0
      t.timestamps
    end
  end
end
