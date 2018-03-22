class CreateSpds < ActiveRecord::Migration[5.1]
  def change
    create_table :spds do |t|
      t.string :spd
      t.references :instansi, foreign_key: true
      t.text :alamat
      t.string :no_tlp
      t.integer :status

      t.timestamps
    end
  end
end
