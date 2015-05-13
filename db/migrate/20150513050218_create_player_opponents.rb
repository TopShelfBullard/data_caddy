class CreatePlayerOpponents < ActiveRecord::Migration
  def change
    create_table :player_opponents do |t|
      t.integer :player_id
      t.integergstat :opponent_id

      t.timestamps null: false
    end
  end
end
