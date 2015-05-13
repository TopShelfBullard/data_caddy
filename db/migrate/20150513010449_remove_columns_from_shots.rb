class RemoveColumnsFromShots < ActiveRecord::Migration
  def change
    remove_column :shots, :hole_id, :integer
    remove_column :shots, :mulligan, :integer
    remove_column :shots, :squib, :boolean
  end
end
