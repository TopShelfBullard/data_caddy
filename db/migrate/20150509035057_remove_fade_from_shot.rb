class RemoveFadeFromShot < ActiveRecord::Migration
  def change
    remove_column :shots, :fade, :boolean
  end
end
