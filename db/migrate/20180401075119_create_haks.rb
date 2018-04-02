class CreateHaks < ActiveRecord::Migration[5.1]
  def change
    create_table :haks do |t|
      t.references :tingkat, foreign_key: true
      t.integer :hak

      t.timestamps
    end
  end
end
