class CreateUserAgendas < ActiveRecord::Migration[5.1]
  def change
    create_table :user_agendas do |t|
      t.references :agenda, foreign_key: true
      t.references :user, foreign_key: true
      t.column :status, :integer, default: 0
      t.string :nilai

      t.timestamps
    end
  end
end
