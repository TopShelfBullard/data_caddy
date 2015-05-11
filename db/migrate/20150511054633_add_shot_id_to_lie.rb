class AddShotIdToLie < ActiveRecord::Migration
  def change
    add_column :lies, :shot_id, :integer
  end
end
