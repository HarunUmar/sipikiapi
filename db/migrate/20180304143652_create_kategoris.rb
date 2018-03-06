class CreateKategoris < ActiveRecord::Migration[5.1]
  def change
    create_table :kategoris do |t|
      t.string :kategori
      t.string :url_icon
      t.column :status, :integer, default: 1

      t.timestamps
    end
  end
end
