class CreateShots < ActiveRecord::Migration
  def change
    create_table :shots do |t|
      t.integer :number
      t.boolean :tee_up
      t.boolean :tee_down
      t.boolean :tee_middle
      t.boolean :off_the_turf
      t.boolean :elevated_tee
      t.boolean :was_hook
      t.boolean :was_draw
      t.boolean :was_pull
      t.boolean :was_pure
      t.boolean :was_push
      t.boolean :was_fade
      t.boolean :was_slice
      t.boolean :was_lob
      t.boolean :was_pop_up
      t.boolean :was_shank
      t.boolean :was_skull
      t.boolean :over_club
      t.boolean :under_club
      t.boolean :high_trajectory
      t.boolean :low_trajectory
      t.boolean :chunked
      t.boolean :topped
      t.boolean :in_cup
      t.boolean :on_apron
      t.boolean :on_green
      t.boolean :in_rough
      t.boolean :on_beach
      t.boolean :in_drink
      t.boolean :out_of_bounds
      t.boolean :on_downslope
      t.boolean :on_upslope
      t.boolean :on_side_hill_right
      t.boolean :on_side_hill_left
      t.boolean :obstructed_by_trees
      t.boolean :on_fairway
      t.boolean :take_mulligan
      t.boolean :take_drop
      t.references :round, index: true
      t.references :club, index: true
      t.references :played_hole, index: true

      t.timestamps null: false
    end
    add_foreign_key :shots, :played_holes
  end
end
