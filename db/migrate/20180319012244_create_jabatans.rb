class CreateJabatans < ActiveRecord::Migration[5.1]
  def change
    create_table :jabatans do |t|
      t.string :jabatan
      t.integer :status

      t.timestamps
    end
  end
end
