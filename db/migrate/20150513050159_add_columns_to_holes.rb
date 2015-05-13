class AddColumnsToHoles < ActiveRecord::Migration
  def change
    add_column :holes, :player_hole_id, :integer
    add_column :holes, :eagle_percentage, :integer
    add_column :holes, :birdy_percentage, :integer
    add_column :holes, :par_percentage, :integer
    add_column :holes, :bogie_percentage, :integerdouble_bogie_percentage
    add_column :holes, :failure_percentage, :integer
  end
end
