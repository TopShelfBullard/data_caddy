class AddSquibAndGoodSpeedToShots < ActiveRecord::Migration
  def change
    add_column :shots, :squib, :boolean, :default => false
    add_column :shots, :good_speed, :boolean, :default => false
  end
end
