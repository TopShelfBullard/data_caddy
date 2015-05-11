class AddColumnsToLie < ActiveRecord::Migration
  def change
    add_column :lies, :tee_up, :boolean
    add_column :lies, :tee_down, :boolean
    add_column :lies, :tee_middle, :boolean
    add_column :lies, :Off_the_turf, :boolean
    add_column :lies, :elevated_tee, :boolean
  end
end
