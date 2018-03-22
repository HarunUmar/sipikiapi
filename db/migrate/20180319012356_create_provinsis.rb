class CreateProvinsis < ActiveRecord::Migration[5.1]
  def change
    create_table :provinsis do |t|
      t.string :provinsi
      t.integer :status

      t.timestamps
    end
  end
end
