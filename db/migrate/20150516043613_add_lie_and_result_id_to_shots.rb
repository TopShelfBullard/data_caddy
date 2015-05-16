class AddLieAndResultIdToShots < ActiveRecord::Migration
  def change
    add_column :shots, :lie_id, :integer
    add_column :shots, :result_id, :integer
  end
end
