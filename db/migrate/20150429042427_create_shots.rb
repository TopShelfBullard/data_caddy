class CreateShots < ActiveRecord::Migration
  def change
    create_table :shots do |t|
      t.integer :round_id
      t.integer :played_hole_id
      t.integer :club_id
      t.integer :number
      t.boolean :tee_up, :boolean
      t.boolean :tee_down, :boolean
      t.boolean :tee_middle, :boolean
      t.boolean :off_the_turf, :boolean
      t.boolean :elevated_tee, :boolean
      t.boolean :was_hook, :boolean
      t.boolean :was_draw, :boolean
      t.boolean :was_pull, :boolean
      t.boolean :was_pure, :boolean
      t.boolean :was_push, :boolean
      t.boolean :was_fade, :boolean
      t.boolean :was_slice, :boolean
      t.boolean :was_lob, :boolean
      t.boolean :was_pop_up, :boolean
      t.boolean :was_shank, :boolean
      t.boolean :was_skull, :boolean
      t.boolean :over_club, :boolean
      t.boolean :under_club, :boolean
      t.boolean :high_trajectory, :boolean
      t.boolean :low_trajectory, :boolean
      t.boolean :chunked, :boolean
      t.boolean :topped, :boolean
      t.boolean :in_cup, :boolean
      t.boolean :on_apron, :boolean
      t.boolean :on_green, :boolean
      t.boolean :in_rough, :boolean
      t.boolean :on_beach, :boolean
      t.boolean :in_drink, :boolean
      t.boolean :out_of_bounds, :boolean
      t.boolean :on_downslope, :boolean
      t.boolean :on_upslope, :boolean
      t.boolean :on_side_hill_right, :boolean
      t.boolean :on_side_hill_left, :boolean
      t.boolean :obstructed_by_trees, :boolean
      t.boolean :on_fairway, :string
      t.boolean :take_mulligan, :boolean
      t.boolean :take_drop, :boolean

      t.timestamps null: false
    end
  end
end
