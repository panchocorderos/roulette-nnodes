class CreateRounds < ActiveRecord::Migration[7.0]
  def change
    create_table :rounds do |t|
      t.integer :result_color, null: false
      t.integer :weather, null: false

      t.timestamps
    end
  end
end
