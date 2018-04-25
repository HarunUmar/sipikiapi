class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.integer :dari
      t.string :ket
      t.integer :untuk
      t.timestamps
    end
  end
end
