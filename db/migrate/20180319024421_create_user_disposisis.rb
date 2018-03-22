class CreateUserDisposisis < ActiveRecord::Migration[5.1]
  def change
    create_table :user_disposisis do |t|
      t.references :user, foreign_key: true
      t.references :disposisi, foreign_key: true
      t.integer :status
      t.string :nilai
      t.datetime :waktu

      t.timestamps
    end
  end
end
