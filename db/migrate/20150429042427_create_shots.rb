class CreateShots < ActiveRecord::Migration
  def change
    create_table :shots do |t|
      t.integer :number
      t.boolean :tee_up
      t.boolean :tee_down
      t.boolean :tee_middle
      t.boolean :off_the_turf
      t.boolean :elevated_tee
      t.boolean :punch
      t.boolean :trick
      t.boolean :full
      t.boolean :quarter
      t.boolean :half
      t.boolean :three_quarters
      t.boolean :hook
      t.boolean :draw
      t.boolean :pull
      t.boolean :pure
      t.boolean :push
      t.boolean :fade
      t.boolean :shot_slice
      t.boolean :left
      t.boolean :right
      t.boolean :center
      t.boolean :lob
      t.boolean :pop_up
      t.boolean :shank
      t.boolean :skull
      t.boolean :over_club
      t.boolean :under_club
      t.boolean :high
      t.boolean :low
      t.boolean :chunk
      t.boolean :top
      t.boolean :soft
      t.boolean :hard
      t.boolean :sweet_spot
      t.boolean :cup
      t.boolean :apron
      t.boolean :green
      t.boolean :rough
      t.boolean :beach
      t.boolean :drink
      t.boolean :out_of_bounds
      t.boolean :downslope
      t.boolean :upslope
      t.boolean :side_hill_right
      t.boolean :side_hill_left
      t.boolean :obstructed
      t.boolean :fairway
      t.boolean :mulligan
      t.boolean :drop
      t.boolean :practice
      t.integer :played_hole_id
      t.references :round, index: true
      t.references :club, index: true
      t.references :played_hole, index: true

      t.timestamps null: false
    end
    add_foreign_key :shots, :played_holes
  end
end
