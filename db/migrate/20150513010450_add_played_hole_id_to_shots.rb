class AddPlayedHoleIdToShots < ActiveRecord::Migration
  def change
    add_column :shots, :played_hole_id, :integer
  end
end
