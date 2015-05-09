class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.boolean :was_hook
      t.boolean :was_draw
      t.boolean :was_pull
      t.boolean :was_pure
      t.boolean :was_push
      t.boolean :was_fade
      t.boolean :was_slice
      t.boolean :was_worm_burner
      t.boolean :was_frenchie
      t.boolean :was_lob
      t.boolean :was_stoney
      t.boolean :was_pop_up
      t.boolean :was_shank
      t.boolean :was_skull
      t.boolean :was_tree_shot
      t.boolean :on_apron
      t.boolean :on_green
      t.boolean :in_jail
      t.boolean :in_jungle
      t.boolean :on_beach
      t.boolean :in_drink
      t.boolean :out_of_bounds
      t.boolean :in_cup
      t.boolean :on_side_hill
      t.boolean :obstructed_by_trees
      t.boolean :in_rough
      t.boolean :on_fairway
      t.boolean :chunked
      t.boolean :topped
      t.boolean :over_club
      t.boolean :under_club
      t.boolean :high_trajectory
      t.boolean :low_trajectory
      t.boolean :take_mulligan
      t.boolean :take_drop
      t.boolean :take_gimme
      t.timestamps null: false
    end
  end
end
