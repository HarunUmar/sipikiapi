class CreateCommentposts < ActiveRecord::Migration[5.1]
  def change
    create_table :commentposts do |t|
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true
      t.string :isi

      t.timestamps
    end
  end
end
