class CreateEselons < ActiveRecord::Migration[5.1]
  def change
    create_table :eselons do |t|
      t.string :eselon
      t.text :ket

      t.timestamps
    end
  end
end
