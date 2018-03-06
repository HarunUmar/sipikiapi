class CreateCommentpengaduans < ActiveRecord::Migration[5.1]
  def change
    create_table :commentpengaduans do |t|
      t.references :pengaduan, foreign_key: true
      t.references :user, foreign_key: true
      t.string :isi
      t.integer :sub

      t.timestamps
    end
  end
end
