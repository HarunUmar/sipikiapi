class CreateCities < ActiveRecord::Migration[5.1]
  def change
    create_table :cities do |t|
      t.references :provinsi, foreign_key: true
      t.string :city
      t.column :status, :integer, default: 1
      t.timestamps
    end
  end
end
