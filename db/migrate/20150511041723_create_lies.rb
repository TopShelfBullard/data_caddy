class CreateLies < ActiveRecord::Migration
  def change
    create_table :lies do |t|
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

      t.timestamps null: false
    end
  end
end
