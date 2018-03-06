class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :no_ktp
      t.string :nama
      t.string :hp
      t.string :url_foto
      t.string :username
      t.string :id_fb
      t.string :token_fb
      t.column :skpd, :integer, default: 1
      t.column :status, :integer, default: 1
      t.timestamps
    end
  end
end
