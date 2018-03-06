class CreateLikepengaduans < ActiveRecord::Migration[5.1]
  def change
    create_table :likepengaduans do |t|
      t.references :pengaduan, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
