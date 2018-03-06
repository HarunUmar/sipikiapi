class CreateUserskpds < ActiveRecord::Migration[5.1]
  def change
    create_table :userskpds do |t|
      t.references :user, foreign_key: true
      t.references :skpd, foreign_key: true
      t.column :jabatan, :string, default: 'staf'
      t.column :status, :integer, default: 0

      t.timestamps
    end
  end
end
