class AddPositionToClubs < ActiveRecord::Migration
  def change
    add_column :clubs, :position, :integer
  end
end
