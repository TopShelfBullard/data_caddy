class AddShotIdToResult < ActiveRecord::Migration
  def change
    add_column :results, :shot_id, :integer
  end
end
