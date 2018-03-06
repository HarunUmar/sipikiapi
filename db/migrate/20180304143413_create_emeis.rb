class CreateEmeis < ActiveRecord::Migration[5.1]
  def change
    create_table :emeis do |t|
      t.references :user, foreign_key: true
      t.string :emei

      t.timestamps
    end
  end
end
