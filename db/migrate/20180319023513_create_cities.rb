class CreateCities < ActiveRecord::Migration[5.1]
  def change
    create_table :cities do |t|
      t.references :provinsi, foreign_key: true
      t.string :city
      t.integer :status

      t.timestamps
    end
  end
end
