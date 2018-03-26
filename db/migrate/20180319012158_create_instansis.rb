class CreateInstansis < ActiveRecord::Migration[5.1]
  def change
    create_table :instansis do |t|
      t.references :city, foreign_key: true
      t.string :instansi
      t.column :status, :integer, default: 1
      t.timestamps
    end
  end
end
