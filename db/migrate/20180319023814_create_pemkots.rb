class CreatePemkots < ActiveRecord::Migration[5.1]
  def change
    create_table :pemkots do |t|
      t.string :pemkot
      t.integer :parent_daftar
      t.integer :parent_atasan
      t.integer :ada_user
      t.integer :kop
      t.integer :group
      t.references :spd, foreign_key: true
      t.timestamps
    end
  end
end
