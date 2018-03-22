class CreateSkps < ActiveRecord::Migration[5.1]
  def change
    create_table :skps do |t|
      t.string :skp
      t.integer :status

      t.timestamps
    end
  end
end
