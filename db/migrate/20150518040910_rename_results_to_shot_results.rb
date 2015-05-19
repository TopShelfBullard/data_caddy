class RenameResultsToShotResults < ActiveRecord::Migration
  def change
    rename_table :results, :shot_results
  end
end
