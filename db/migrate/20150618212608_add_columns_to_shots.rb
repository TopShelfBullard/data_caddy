class AddColumnsToShots < ActiveRecord::Migration
  def change
    add_column :shots, :gimme, :boolean, :default => false
    add_column :shots, :knocked_in_bounds, :boolean, :default => false
    add_column :shots, :worm_burner, :boolean, :default => false
  end
end
