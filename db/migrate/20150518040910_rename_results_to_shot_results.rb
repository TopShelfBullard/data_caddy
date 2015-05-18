class RenameResultsToShotResults < ActiveRecord::Migration
  def change
    rename_table :shot_results, :shot_results
  end
end
