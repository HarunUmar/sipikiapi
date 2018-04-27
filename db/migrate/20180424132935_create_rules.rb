class CreateRules < ActiveRecord::Migration[5.1]
  def change
    create_table :rules do |t|
      t.integer :dari
      t.integer :tujuan
      t.string :catatan
      t.references :city, foreign_key: true
      t.timestamps
    end
  end
end
