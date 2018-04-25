class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.references :pemkot, foreign_key: true
      t.references :eselon, foreign_key: true
      t.references :city, foreign_key: true
      t.string :fb
      t.string :token
      t.string :nama
      t.string :hp
      t.column :status, :integer, default: 0
      t.timestamps
    end
  end
end
