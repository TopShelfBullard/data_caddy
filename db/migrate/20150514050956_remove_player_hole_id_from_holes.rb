class RemovePlayerHoleIdFromHoles < ActiveRecord::Migration
  def change
    remove_column :holes, :player_hole_id, :integer
  end
end
