class AddColumnsToPlayedHoles < ActiveRecord::Migration
  def change
    add_column :played_holes, :lie_id, :integer
    add_column :played_holes, :club_id, :integer
    add_column :played_holes, :result_id, :integer
  end
end
