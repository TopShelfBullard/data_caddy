class CreatePlayerHoles < ActiveRecord::Migration
  def change
    create_table :player_holes do |t|
      t.integer :player_id
      t.integer :hole_id
      t.integer :best_score
      t.integer :worst_score
      t.integer :most_puts
      t.integer :least_putts
      t.integer :average_putts

      t.timestamps null: false
    end
  end
end
