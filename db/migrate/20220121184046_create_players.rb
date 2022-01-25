class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :name, null: false
      t.integer :cash, null: false, default: 10000

      t.timestamps
    end
  end
end
