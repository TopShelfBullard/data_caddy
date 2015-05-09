class CreatePlayedHoles < ActiveRecord::Migration
  def change
    create_table :played_holes do |t|
      t.integer :hole_id
      t.integer :round_id
      t.integer :player_id

      t.timestamps null: false
    end
  end
end
