class CreateGambarposts < ActiveRecord::Migration[5.1]
  def change
    create_table :gambarposts do |t|
      t.references :post, foreign_key: true
      t.string :url

      t.timestamps
    end
  end
end
