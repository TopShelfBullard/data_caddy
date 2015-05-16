class RemoveLieAndResultIdFromPlayedHoles < ActiveRecord::Migration
  def change
    remove_column :played_holes, :lie_id, :integer
    remove_column :played_holes, :result, :integer
  end
end
