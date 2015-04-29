class CreateShots < ActiveRecord::Migration
  def change
    create_table :shots do |t|
      t.integer :round_id
      t.integer :hole_id
      t.integer :club_id
      t.integer :number
      t.integer :mulligan
      t.boolean :slice
      t.boolean :fade
      t.boolean :squib

      t.timestamps null: false
    end
  end
end
