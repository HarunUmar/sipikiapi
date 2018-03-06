class CreateGambarpengaduans < ActiveRecord::Migration[5.1]
  def change
    create_table :gambarpengaduans do |t|
      t.references :pengaduan, foreign_key: true
      t.string :url

      t.timestamps
    end
  end
end
