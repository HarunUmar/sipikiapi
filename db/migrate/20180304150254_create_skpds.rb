class CreateSkpds < ActiveRecord::Migration[5.1]
  def change
    create_table :skpds do |t|
      t.string :skpd
      t.column :status, :integer, default: 0
      t.timestamps
    end
  end
end
