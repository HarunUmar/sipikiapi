class CreateInstansis < ActiveRecord::Migration[5.1]
  def change
    create_table :instansis do |t|
      t.string :instansi
      t.column :status, :integer, default: 1
      t.timestamps
    end
  end
end
