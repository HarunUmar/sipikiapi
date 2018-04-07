class CreateSpds < ActiveRecord::Migration[5.1]
  def change
    create_table :spds do |t|
      t.string :spd
      t.references :instansi, foreign_key: true
      t.text :alamat
      t.string :lat
      t.string :lang
      t.string :no_tlp
      t.column :status, :integer, default: 1

      t.timestamps
    end
  end
end
