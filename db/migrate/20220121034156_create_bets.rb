class CreateBets < ActiveRecord::Migration[7.0]
  def change
    create_table :bets do |t|
      t.integer :amount
      t.integer :color, :result, default: 0
      t.belongs_to :player
      t.belongs_to :round
      t.timestamps
    end
  end
end
