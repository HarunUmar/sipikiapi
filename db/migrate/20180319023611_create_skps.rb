class CreateSkps < ActiveRecord::Migration[5.1]
  def change
    create_table :skps do |t|
      t.string :skp
      t.column :status, :integer, default: 1

      t.timestamps
    end
  end
end
