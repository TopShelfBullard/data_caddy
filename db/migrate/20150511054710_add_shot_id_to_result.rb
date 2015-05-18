class AddShotIdToResult < ActiveRecord::Migration
  def change
    add_column :shot_results, :shot_id, :integer
  end
end
