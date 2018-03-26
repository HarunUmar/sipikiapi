class CreateKinerjas < ActiveRecord::Migration[5.1]
  def change
    create_table :kinerjas do |t|
      t.references :skp, foreign_key: true
      t.string :kinerja
     t.column :status, :integer, default: 1

      t.timestamps
    end
  end
end
