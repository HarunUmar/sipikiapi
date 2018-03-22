class CreateKinerjas < ActiveRecord::Migration[5.1]
  def change
    create_table :kinerjas do |t|
      t.references :skp, foreign_key: true
      t.string :kinerja
      t.integer :status

      t.timestamps
    end
  end
end
