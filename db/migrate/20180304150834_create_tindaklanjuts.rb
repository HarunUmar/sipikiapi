class CreateTindaklanjuts < ActiveRecord::Migration[5.1]
  def change
    create_table :tindaklanjuts do |t|
      t.references :pengaduan, foreign_key: true
      t.references :userskpd, foreign_key: true
      t.column :status, :integer, default: 1
      t.column :dikerjakan, :integer, default: 0
      t.string :url
      
      t.timestamps
    end
  end
end
