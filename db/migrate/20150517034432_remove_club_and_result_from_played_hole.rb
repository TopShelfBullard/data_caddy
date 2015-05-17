class RemoveClubAndResultFromPlayedHole < ActiveRecord::Migration
  def change
    remove_column :played_holes, :club_id, :integer
    remove_column :played_holes, :result_id, :integer
  end
end
