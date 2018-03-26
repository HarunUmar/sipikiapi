class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.references :spd, foreign_key: true
      t.references :jabatan, foreign_key: true
      t.references :eselon, foreign_key: true
      t.references :city, foreign_key: true
      t.string :fb
      t.string :token
      t.string :nama
      t.string :hp
      t.column :status, :integer, default: 1

      t.timestamps
    end
  end
end
