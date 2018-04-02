class CreateTingkats < ActiveRecord::Migration[5.1]
  def change
    create_table :tingkats do |t|
      t.string :tingkat

      t.timestamps
    end
  end
end
