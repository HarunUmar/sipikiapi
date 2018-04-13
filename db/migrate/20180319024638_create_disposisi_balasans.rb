class CreateDisposisiBalasans < ActiveRecord::Migration[5.1]
  def change
    create_table :disposisi_balasans do |t|
      t.references :user_disposisi, foreign_key: true
      t.references :user, foreign_key: true
      t.text :isi

      t.timestamps
    end
  end
end
