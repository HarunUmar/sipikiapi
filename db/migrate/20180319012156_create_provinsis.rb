class CreateProvinsis < ActiveRecord::Migration[5.1]
  def change
    create_table :provinsis do |t|
      t.string :provinsi
      t.column :status, :integer, default: 1
      t.timestamps
    end
  end
end
