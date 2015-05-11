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
      t.boolean :was_goldie_bounce
      t.boolean :was_lob
      t.boolean :was_stoney
      t.boolean :was_pop_up
      t.boolean :was_shank
      t.boolean :was_skull
      t.boolean :was_tree_shot
      t.boolean :over_club
      t.boolean :under_club
      t.boolean :high_trajectory
      t.boolean :low_trajectory
      t.boolean :chunked
      t.boolean :topped
      t.timestamps null: false
    end
  end
end
