class RemoveBananaFromShots < ActiveRecord::Migration
  def change
    remove_column :shots, :banana_hook, :boolean
    remove_column :shots, :banana_slice, :boolean
  end
end
