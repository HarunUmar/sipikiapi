class CreateGambarDisposisis < ActiveRecord::Migration[5.1]
  def change
    create_table :gambar_disposisis do |t|
      t.references :disposisi, foreign_key: true
      t.string :url
      t.timestamps
    end
  end
end
