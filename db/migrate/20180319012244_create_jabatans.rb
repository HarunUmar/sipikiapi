class CreateJabatans < ActiveRecord::Migration[5.1]
  def change
    create_table :jabatans do |t|
      t.references :instansi, foreign_key: true
      t.references :city, foreign_key: true
      t.string :jabatan
      t.column :status, :integer, default: 1

      t.timestamps
    end
  end
end
